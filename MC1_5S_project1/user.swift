//
//  userData.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/11.
//

import Foundation
import SwiftUI

struct user: Codable, Identifiable {
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
