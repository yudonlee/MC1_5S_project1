//
//  userData.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/11.
//

import Foundation
import SwiftUI

struct UserProfile: Codable, Identifiable {
//    private 채워야 하나?
    var name: String
    var password: String
    var level: Int
    var scrapList: [Int]
    
    var id: String { name }
    
    enum CodingKeys: CodingKey {
        case name, password, level, scrapList
    }
    
}

class UserInformation {
    static let loginUser: UserInformation = UserInformation()
    var name: String?
    var password: String?
<<<<<<< HEAD
    var data: UserProfile?
=======
    var level: Int?
>>>>>>> 7c23cdf231ae1ba1bba61f0b7ca25c4f941c5a40
    
    func isPasswordRight(id: String, inputPassword: String) -> Bool {
        for user in userProfileList {
            if id == user.name, inputPassword == user.password {
                    name = id
                    password = inputPassword
                    data = user
                    return true
                }
        }
        return false
    }
}



