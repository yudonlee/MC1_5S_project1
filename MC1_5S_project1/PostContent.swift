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
        let created_at: Date
        let updated_at: Date
        let isAnonymous: Bool
        let contents: String
        var id: String { name }
    }
    
    let title: String
    let name: String
    let index: String
    let created_at: Date
    let updated_at: Date
    let certifiedUser: Bool
    let isAnonymous: Bool
    let answerCount: String
    
    var answerCountToInt: Int {
        return Int(answerCount) ?? 0
    }
//    마지막 이름을 통해서 divider 하지 않도록 하기
    var lastAnswerName: String {
        return answer[answerCountToInt - 1].name
    }
    
    let answer: [Answer]
    let id = UUID()
    
    enum CodingKeys: CodingKey {
        case title, name
        case index, certifiedUser
        case created_at, updated_at
        case isAnonymous, answerCount
        case answer
    }
}


