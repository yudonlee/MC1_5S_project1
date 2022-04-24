//
//  PostData.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/07.
//

import Foundation
import SwiftUI


public class postViewModel: ObservableObject {
//    Pulished는 해당하는 변수가 변경시 자동으로 objectWillChange.send()가 호출되고, 이를통해 뷰가 자동으로 업데이트 된다!
//    Published를 사용하지 않으면 뷰가 실시간으로 업데이트가 되지 않음.
//    https://nsios.tistory.com/120 이건 한글판 블로그에서 가져온 것. 오피셜 문서를 통해 보완 필요! ㄴ
    @Published var postContents: [PostContent]
//    = load("posts.json")
    init(jsonFileName: String) {
        postContents = load(jsonFileName)
    }
//    var postContents: [PostContent] = load("posts.json")
    func addNewContent(title: String, name: String,
                       created_at: Date, updated_at: Date, certifiedUser: Bool,
                       isAnonymous: Bool, answerCount:String) {
        let index: String = String(postContents.count)
        let new_post:PostContent = PostContent(
            title: title, name: name, index:index,
            created_at: created_at, updated_at: updated_at, certifiedUser: certifiedUser,
            isAnonymous: isAnonymous, answerCount: "0", answer: [])
        postContents.append(new_post)
    }
}


var postContentList: [PostContent] = load("posts.json")
var userProfileList: [UserProfile] = load("users.json")
var userLevelDic : [String: Int] = [ : ]


//class ShuffleView: ObservableObject {
//    @Published var postC: [PostContent] = load("posts.json")
//    func shuffle() {
//        postContentList.shuffle()
//    }
//}

func loadUserLevel() {
    for user in userProfileList {
        userLevelDic.updateValue(user.level, forKey: user.name)
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}

func addNewContent(title: String, name: String,
                   created_at: Date, updated_at: Date, certifiedUser: Bool,
                   isAnonymous: Bool, answerCount:String) {
    let index: String = String(postContentList.count)
    let new_post:PostContent = PostContent(
        title: title, name: name, index:index,
        created_at: created_at, updated_at: updated_at, certifiedUser: certifiedUser,
        isAnonymous: isAnonymous, answerCount: "0", answer: [])
    postContentList.append(new_post)
}


//func addNewAnswer(name: String, created_at: Date, updated_at: Date, certifiedUser: Bool,
func addNewAnswer(answerComment: String, name: String, created_at: Date, updated_at: Date, isAnonymous: Bool, index: Int) {
    let newAnswerComment: PostContent.Answer = PostContent.Answer(name: name, created_at: created_at, updated_at: updated_at, isAnonymous: isAnonymous, contents: answerComment)
    postContentList[index].answer.append(newAnswerComment)
    postContentList[index].answerCount = "\(postContentList[index].answer.count)"
    
}




