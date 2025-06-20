//
//  ApiManager.swift
//  PrivacyDefender
//
//  Created by Ali ur Rahman Qureshi on 14/11/2023.
//

import Foundation
import CryptoKit
import FirebaseAnalytics

final class ApiHelper {
    
    // MARK: - Private Properties
    
    var version: String {
        let url = Constants.shared.baseUrl()
        let ninthCharacter = url[url.index(url.startIndex, offsetBy: 8)]
        return "Version \(Constants.appVersion)-\(Constants.appBuild)\(ninthCharacter)"
    }
    
    // MARK: - Public Methods
    
    static public func getCompleteResponse<T: Codable>(endpoint: ApiEndpoints,
                                                       body: [String: Any]? = nil,
                                                       printResponse: Bool = false) async throws -> BaseResponse<T> {
            
        guard let newRequest = prepareApiRequest(endpoint: endpoint) else {
            throw ApiErrorType.api_invalidURL
        }
        
        var request = newRequest
        
        if let body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
            } catch {
                let error = ApiErrorType.api_jsonSerializationFailed
                printError(endpoint: endpoint, error: error)
                throw error
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            if let newResponse = response as? HTTPURLResponse {
                print("Status Code = \(newResponse.statusCode) for API -> \(endpoint)")
                if newResponse.statusCode == 401 {
                    let error = ApiErrorType.unAuthorizedAccess
                    printError(endpoint: endpoint, error: error)
                    
                    NotificationCenter.default.post(name: .api401Error,
                                                    object: nil,
                                                    userInfo: nil)
                    throw error
                }
            }
            
            let error = ApiErrorType.api_invalidStatusCode
            printError(endpoint: endpoint, error: error)
            throw error
        }
        
        if printResponse {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
               let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
        
        do {
            let decoder = JSONDecoder()
            let baseResponse = try decoder.decode(BaseResponse<T>.self, from: data)
            
            return baseResponse
        } catch {
            print("Decoding error: \(error)")
            let error = ApiErrorType.api_ParsingFailed
            printError(endpoint: endpoint, error: error)
            throw error
        }
    }

    
    static public func getDataObject<T: Codable>(endpoint: ApiEndpoints,
                                            body: [String: Any]? = nil,
                                            printResponse: Bool = false) async throws -> T {
            
        guard let newRequest = prepareApiRequest(endpoint: endpoint) else {
            throw ApiErrorType.api_invalidURL
        }
        
        var request = newRequest
        
        if let body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
            } catch {
                let error = ApiErrorType.api_jsonSerializationFailed
                printError(endpoint: endpoint, error: error)
                throw error
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            if let newResponse = response as? HTTPURLResponse {
                print("Status Code = \(newResponse.statusCode) for API -> \(endpoint)")
                if newResponse.statusCode == 401 {
                    let error = ApiErrorType.unAuthorizedAccess
                    printError(endpoint: endpoint, error: error)
                    
                    NotificationCenter.default.post(name: .api401Error,
                                                    object: nil,
                                                    userInfo: nil)
                    throw error
                }
            }
            
            let error = ApiErrorType.api_invalidStatusCode
            printError(endpoint: endpoint, error: error)
            throw error
        }
        
        if printResponse {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
               let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
        
        do {
            let decoder = JSONDecoder()
            let baseResponse = try decoder.decode(BaseResponse<T>.self, from: data)
            
            if let error = baseResponse.error, error {
                print("API response error: \(baseResponse.message ?? "Unknown error")")
            }
            
            return baseResponse.data
        } catch {
            print("Decoding error: \(error)")
            let error = ApiErrorType.api_ParsingFailed
            printError(endpoint: endpoint, error: error)
            throw error
        }
    }

    static public func getJson(endpoint: ApiEndpoints,
                                body: [String: Any]?,
                                printResponse: Bool = false) async throws -> [String: Any] {
        
        guard let newRequest = ApiHelper.prepareApiRequest(endpoint: endpoint) else {
            let error = ApiErrorType.api_invalidURL
            printError(endpoint: endpoint, error: error)
            throw error
        }
        
        var request = newRequest
        
        if let body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
            } catch {
                let error = ApiErrorType.api_jsonSerializationFailed
                printError(endpoint: endpoint, error: error)
                throw error
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            if let newResponse = response as? HTTPURLResponse {
                if newResponse.statusCode == 401 {
                    let error = ApiErrorType.unAuthorizedAccess
                    printError(endpoint: endpoint, error: error)
                    NotificationCenter.default.post(name: .api401Error,
                                                    object: nil,
                                                    userInfo: nil)
                    throw ApiErrorType.unAuthorizedAccess
                }
            }
            
            let error = ApiErrorType.api_invalidStatusCode
            printError(endpoint: endpoint, error: error)
            throw ApiErrorType.api_invalidStatusCode
        }
        
        if printResponse {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
               let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            } else {
                let error = ApiErrorType.api_jsonSerializationFailed
                printError(endpoint: endpoint, error: error)
            }
        }
                
        guard
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        else {
            let error = ApiErrorType.api_invalidData
            throw error
        }
        
        return json
    }
    
    // MARK: - Private Methods
    
    static private func printError(endpoint: ApiEndpoints, error: Error) {
        print("API Error: \(endpoint) --> \(error)")
    }
    
    static private func prepareApiRequest(endpoint: ApiEndpoints) -> URLRequest? {
        
        guard
            let url = URL(string: "\(Constants.shared.baseUrl())\(endpoint.urlString)")
        else {
            return nil
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method
        
        // Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Constants.clientSecret, forHTTPHeaderField: "Client-Secret")
        
        if endpoint != .registerUser {
            request.addValue(CommonVariables.shared.authToken, forHTTPHeaderField: "Authorization")
        }
        
        request.timeoutInterval = 10
        
        return request
    }
}

enum md5HashGenerator {
    static func make(for string: String) -> String {
        let data = Data(string.utf8)                                    /// Convert the string to Data
        let digest = Insecure.MD5.hash(data: data)                      /// Create an MD5 digest
        return digest.map { String(format: "%02hhx", $0) }.joined()     /// Convert the digest to a hex string/
    }
}
