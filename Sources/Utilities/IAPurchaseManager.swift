//
//  IAPHandler.swift
//  Privacy Defender
//
//  Created by Shahzad Jafar - Pligence on 28/10/2021.
//

import Foundation
import StoreKit
import UIKit
import Firebase
import SwiftUI
import FirebaseAnalytics

enum IAPProduct: String {
    case monthly    = "com.pligence.payment.monthly"
    case halfyearly = "com.pligence.payment.halfyearly"
    case yearly     = "com.pligence.payment.yearly"
}

final class IAPurchaseManager: NSObject {
    
    // MARK: - Public Properties
    
    @objc static let shared = IAPurchaseManager()
    
    /// Set this flag to true to bypass payment
    var byPassPayment = false
    ///comment ended
    
    var isMonthlyActive = false
    var isHalfYearlyActive    = false
    var isYearlyActive  = false
    
    var latestRecieptInfo: LatestReceipt? {
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: "LatestReceiptInfo")
            }
        }
        
        get {
            if let savedReciept = UserDefaults.standard.object(forKey: "LatestReceiptInfo") as? Data {
                let decoder = JSONDecoder()
                if let receipt = try? decoder.decode(LatestReceipt.self, from: savedReciept) {
                    return receipt
                }
                return nil
            }
            return nil
        }
    }
    
    // MARK: - Private Properties

    @objc private(set) var loadedProducts: [SKProduct]?
    
    private var firstSuccessBlock: SuccessBlock?
    private var failureBlock: FailureBlock?
    
    private var refreshSubscriptionSuccessBlock: SuccessBlock?
    private var refreshSubscriptionFailureBlock: FailureBlock?
    
    private var isProductsLoaded = false
    private var isActualPurchase = false
    private var purchasedCount = 0    
    
    // MARK: - Public Methods
    
    func updatePaymentFromMemory() {
        
        isMonthlyActive     = isSubscriptionValid(IAPProduct.monthly.rawValue)
        isHalfYearlyActive  = isSubscriptionValid(IAPProduct.halfyearly.rawValue)
        isYearlyActive      = isSubscriptionValid(IAPProduct.yearly.rawValue)
        
        if isMonthlyActive || isHalfYearlyActive || isYearlyActive {
            Defaults.shared.setIsPurchasedThroughAppstore(value: true)
        } else {
            Defaults.shared.setIsPurchasedThroughAppstore(value: false)
        }
    }
    
    func start() {
        
        SKPaymentQueue.default().add(self)
        guard !isProductsLoaded else {
            return
        }
        
        let request = SKProductsRequest(productIdentifiers: [IAPProduct.monthly.rawValue,
                                                             IAPProduct.halfyearly.rawValue,
                                                             IAPProduct.yearly.rawValue])
        request.delegate = self
        request.start()
        
        if !CommonVariables.shared.isPurchased {
            IAPurchaseManager.shared.restorePurchaseAndSave {
                IAPurchaseManager.shared.updatePaymentFromMemory()
                print("Restore purchases Success")
            } failure: { error in
                IAPurchaseManager.shared.updatePaymentFromMemory()
                print("Restore purchases Failure: \(error?.localizedDescription ?? "")")
            }
        }
        
        isProductsLoaded = true
    }
    
    func expirationDateFor(_ identifier : String) -> Date? {
        return UserDefaults.standard.object(forKey: identifier) as? Date
    }
    
    func purchase(product: SKProduct,
                  success: @escaping SuccessBlock,
                  failure: @escaping FailureBlock) {
        
        guard SKPaymentQueue.canMakePayments() else {
            return
        }
        
        guard SKPaymentQueue.default().transactions.last?.transactionState != .purchasing else {
            return
        }
        
        isActualPurchase = true
        self.firstSuccessBlock = success
        self.failureBlock = failure
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    func restorePurchaseAndSave(success: @escaping SuccessBlock,
                          failure: @escaping FailureBlock) {
        
        self.firstSuccessBlock = success
        self.failureBlock = failure
        
        print("Restore purchases requested")
        
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        
        if queue.transactions.isEmpty {
            self.failureBlock?(NSError(domain: "StoreKit", code: 0, userInfo: [NSLocalizedDescriptionKey: "No transactions to restore."]))
        } else {
            self.firstSuccessBlock?()
        }
        cleanUp()
    }
    
    private func refreshSubscriptionsStatus(callback: @escaping SuccessBlock,
                                            failure : @escaping FailureBlock) {
        
        self.refreshSubscriptionSuccessBlock = callback
        self.refreshSubscriptionFailureBlock = failure
        
        guard let receiptUrl = Bundle.main.appStoreReceiptURL else {
            refreshReceipt()
            // do not call block in this case. It will be called inside after receipt refreshing finishes.
            return
        }
        
#if DEBUG
        let urlString = "https://sandbox.itunes.apple.com/verifyReceipt"
#else
        let urlString = "https://buy.itunes.apple.com/verifyReceipt"
#endif
        let receiptData = try? Data(contentsOf: receiptUrl).base64EncodedString()
        let requestData = ["receipt-data" : receiptData ?? "",
                           "password" : Constants.app_secret,
                           "exclude-old-transactions" : true] as [String : Any]
        
        var request = URLRequest(url: URL(string: urlString)!)
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: requestData, options: [])
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                if data != nil {
                    if let json = try? JSONSerialization.jsonObject(with: data!){
                        self.parseReceipt(json as! Dictionary<String, Any>)
                        return
                    }
                } else {
                    Log.e("error validating receipt: \(error?.localizedDescription ?? "")")
                }
                self.refreshSubscriptionFailureBlock?(error)
                self.cleanUpRefeshReceiptBlocks()
            }
        }.resume()
    }
    
    // MARK: - Private Methods
    
    private func parseReceipt(_ json : Dictionary<String, Any>) {
        
        guard let receipts_array = json["latest_receipt_info"] as? [Dictionary<String, Any>] else {
            self.refreshSubscriptionFailureBlock?(nil)
            self.cleanUpRefeshReceiptBlocks()
            return
        }
        
        for receipt in receipts_array {
            
            do {
                let recieptModel: LatestReceipt = try LatestReceipt.init(data: JSONSerialization.data(withJSONObject: receipt))
                
                if recieptModel == latestRecieptInfo {
                } else {
                    latestRecieptInfo = recieptModel
                    Task {
                        await ApiManager.shared.postLatestReceipt()
                    }
                }
            } catch let err {
                Log.e(err)
            }
            
            let productID = receipt["product_id"] as! String
            
            if let dateFromString = getDate(from: receipt["expires_date"] as Any) {
                
                let now = Date()
                
                if dateFromString > now {
                    
                    print("PurchaseManager: \(dateFromString) \(now)  \(productID)")
                    
                    UserDefaults.standard.set(dateFromString, forKey: productID)
                    updatePaymentFromMemory()
                }
            }
        }
        
        self.refreshSubscriptionSuccessBlock?()
        self.cleanUpRefeshReceiptBlocks()
    }
    
    private func getDate(from rawValue: Any) -> Date? {
        
        guard let dateString = rawValue as? String else {
            return nil
        }

        // Define a DateFormatter with the specific format and locale
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX") // POSIX locale ensures consistent formatting
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV" // "VV" for timezone identifier
        
        // Attempt to parse the date string
        if let date = formatter.date(from: dateString) {
            return date
        } else {
            Log.e("Error: Unable to parse the date string")
            return nil
        }
    }
    
    private func refreshReceipt() {
        let request = SKReceiptRefreshRequest(receiptProperties: nil)
        request.delegate = self
        request.start()
    }
    
    private func cleanUpRefeshReceiptBlocks() {
        self.refreshSubscriptionSuccessBlock = nil
        self.refreshSubscriptionFailureBlock = nil
    }
}

// MARK: - SKReceipt Refresh Request Delegate

extension IAPurchaseManager: SKRequestDelegate {
    
    func requestDidFinish(_ request: SKRequest) {
        if request is SKReceiptRefreshRequest {
            refreshSubscriptionsStatus(callback: self.firstSuccessBlock ?? {},
                                       failure: self.failureBlock ?? { _ in
            })
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        
        if request is SKReceiptRefreshRequest {
            self.refreshSubscriptionFailureBlock?(error)
            self.cleanUpRefeshReceiptBlocks()
        }
        Log.e("error: \(error.localizedDescription)")
    }
    
    private func extractPurchase(transactions: [SKPaymentTransaction]) {
        
        let transactionsWithDate = transactions.filter { $0.transactionDate != nil }

        let monthlyTransactions = transactionsWithDate.filter {
            $0.payment.productIdentifier == IAPProduct.monthly.rawValue
            
        }
        
        for transaction in monthlyTransactions {
            
            let currentDate = transaction.transactionDate!
            let calendar = Calendar.current
            var dateComponents = DateComponents()
            
            dateComponents.month = 1
            
            if let expiryDate = calendar.date(byAdding: dateComponents, to: currentDate),
               expiryDate > Date() {
                saveToMemory(plan: .monthly, expiryDate: expiryDate)
                break
            }
        }
        
        let halfYearlyTransactions = transactionsWithDate.filter {
            $0.payment.productIdentifier == IAPProduct.halfyearly.rawValue
        }
        
        for transaction in halfYearlyTransactions {
            
            let currentDate = transaction.transactionDate!
            let calendar = Calendar.current
            var dateComponents = DateComponents()
            
            dateComponents.month = 6
            
            if let expiryDate = calendar.date(byAdding: dateComponents, to: currentDate),
               expiryDate > Date() {
                saveToMemory(plan: .halfyearly, expiryDate: expiryDate)
                break
            }
        }
        
        let yearlyTransactions = transactionsWithDate.filter {
            $0.payment.productIdentifier == IAPProduct.yearly.rawValue
        }
        
        for transaction in yearlyTransactions {
            
            let currentDate = transaction.transactionDate!
            let calendar = Calendar.current
            var dateComponents = DateComponents()
            
            dateComponents.month = 12
            
            if let expiryDate = calendar.date(byAdding: dateComponents, to: currentDate),
               expiryDate > Date() {
                saveToMemory(plan: .yearly, expiryDate: expiryDate)
                break
            }
        }
    }
    
    private func saveToMemory(plan: IAPProduct, expiryDate: Date) {
        UserDefaults.standard.set(expiryDate, forKey: plan.rawValue)
        Defaults.shared.setIsPurchasedThroughAppstore(value: true)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .inAppProductDidLoad, object: nil)
        }
    }
}

// MARK: - SKProducts Request Delegate
extension IAPurchaseManager: SKProductsRequestDelegate {
    
    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        loadedProducts = response.products
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .inAppProductDidLoad, object: nil)
        }
    }
}

// MARK: - SKPayment Transaction Observer
extension IAPurchaseManager: SKPaymentTransactionObserver {
    
    public func paymentQueue(_ queue: SKPaymentQueue, 
                             updatedTransactions transactions: [SKPaymentTransaction]) {
        
        extractPurchase(transactions: transactions)
        
        for transaction in transactions {
                        
            switch transaction.transactionState {
                    
                case .purchased, .restored:
                    
                    SKPaymentQueue.default().finishTransaction(transaction)
                    
                    if transactions.count <= 2 {
                        notifyIsPurchased()
                    }
                    
                    break
                    
                case .failed:
                    SKPaymentQueue.default().finishTransaction(transaction)
                    self.failureBlock?(transaction.error)
                    cleanUp()
                    break
                    
                case .deferred, .purchasing:
                    break
                default:
                    break
            }
        }
    }
    
    private func notifyIsPurchased() {
        
        refreshSubscriptionsStatus(callback: { Analytics.logEvent(FirebaseEvents.subscription_successful.rawValue, parameters: nil)
            self.firstSuccessBlock?()
            self.cleanUp()
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .inAppProductDidLoad, object: nil)
            }
        }) { (error) in
            // couldn't verify receipt
            
            Analytics.logEvent(FirebaseEvents.subscription_failed.rawValue, parameters: nil)
            IAPurchaseManager.shared.updatePaymentFromMemory()
            self.failureBlock?(error)
            self.cleanUp()
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .inAppProductDidLoad, object: nil)
            }
        }
    }
    
    //Payment
    func isSubscriptionValid(_ identifier : String) -> Bool {
        
        guard
            let date = UserDefaults.standard.object(forKey: identifier) as? Date
        else {
            return false
        }
        
        let now = Date()
        let isValid = date >= now
        
        return isValid
    }
    
    func cleanUp() {
        self.firstSuccessBlock = nil
        self.failureBlock = nil
    }
}
