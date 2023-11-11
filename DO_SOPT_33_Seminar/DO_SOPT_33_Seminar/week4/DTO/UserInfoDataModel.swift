//
//  UserInfoDataModel.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/11/23.
//

import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}
