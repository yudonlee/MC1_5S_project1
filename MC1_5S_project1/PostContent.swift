//
//  PostContent.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/07.
//

import Foundation
import SwiftUI

struct PostContent: Codable, Identifiable {
    struct Answer: Codable, Identifiable {
        let name: String
        let contents: String
        var id: String { name }
    }
    
    let title: String
    let name: String
    let index: String
    let certifiedUser: Bool
    let answerCount: String
    let answer: [Answer]
    var id: String { name }
    
    enum CodingKeys: CodingKey {
        case title, name
        case index, certifiedUser
        case answerCount, answer
    }
    
}


