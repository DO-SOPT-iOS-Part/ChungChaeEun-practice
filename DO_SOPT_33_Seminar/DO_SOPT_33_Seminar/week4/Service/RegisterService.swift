//
//  RegisterService.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/11/23.
//

import Foundation

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequestBody(userName: String,
                         password: String,
                         nickName: String) -> Data? {
        do {
            let data = RegisterRequestBody(username: userName,
                                           password: password,
                                           nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        let url = URL(string: baseURL + "/members")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func PostRegisterData(userName: String,
                          password: String,
                          nickName: String) async throws -> Int {
        do {
            guard let body = makeRequestBody(userName: userName,
                                             password: password,
                                             nickName: nickName)
            else { throw NetworkError.responseDecodingError }
            
            let request = self.makeRequest(body: body)
            let (_, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return httpResponse.statusCode
        } catch {
            throw error
        }
        
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
