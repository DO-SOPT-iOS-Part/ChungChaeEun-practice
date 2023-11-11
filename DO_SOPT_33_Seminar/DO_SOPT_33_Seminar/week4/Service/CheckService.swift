//
//  CheckService.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/11/23.
//

import Foundation

class CheckService {
    static let shared = CheckService()
    private init() {}
    
    func makeRequest(username: String) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        let url = URL(string: baseURL + "/members/check?username=\(username)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func GetRegisterData(username: String) async throws -> Bool? {
        do {
            let request = self.makeRequest(username: username)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseCheckData(data: data)
        } catch {
            throw error
        }
    }
    
    
    private func parseCheckData(data: Data) -> Bool? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CheckResponseDTO.self, from: data)
            return result.isExist
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
