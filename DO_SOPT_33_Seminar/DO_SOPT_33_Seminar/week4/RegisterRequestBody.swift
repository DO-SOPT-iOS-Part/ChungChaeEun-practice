//
//  RegisterRequestBody.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/11/23.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
