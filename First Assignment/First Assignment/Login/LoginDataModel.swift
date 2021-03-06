//
//  LoginDataModel.swift
//  First Assignment
//
//  Created by 김지수 on 2021/05/12.
//

import Foundation

// MARK: - LoginDataModel
struct LoginDataModel: Codable {
    let success: Bool
    let message: String
    let data: UserData?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserData.self, forKey: .data)) ?? nil
    }
}

// MARK: - UserData
struct UserData: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
