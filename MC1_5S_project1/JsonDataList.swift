//
//  PostData.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/07.
//

import Foundation
import SwiftUI


public class postViewModel: ObservableObject {
    @Published var postContents: [PostContent] = load("posts.json")
    func addNewContent(title: String, name: String,
                       created_at: Date, updated_at: Date, certifiedUser: Bool,
                       isAnonymous: Bool, answerCount:String) {
        let index: String = String(postContents.count)
        let new_post:PostContent = PostContent(
            title: title, name: name, index:index,
            created_at: created_at, updated_at: updated_at, certifiedUser: certifiedUser,
            isAnonymous: isAnonymous, answerCount: "0", answer: [])
        postContents.insert(new_post, at:0)
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
    print("loaduserLevel\n\n\n\n\n\n\n")
    for user in userProfileList {
        userLevelDic.updateValue(user.level, forKey: user.name)
//        print("\(user.level) and \(user.name)")
    }
    print("민준아!\(userLevelDic["민준"])")
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
    postContentList.insert(new_post, at:0)
}


//func addNewAnswer(name: String, created_at: Date, updated_at: Date, certifiedUser: Bool,
func addNewAnswer(answerComment: String, name: String, created_at: Date, updated_at: Date, isAnonymous: Bool, index: Int) {
    let newAnswerComment: PostContent.Answer = PostContent.Answer(name: name, created_at: created_at, updated_at: updated_at, isAnonymous: isAnonymous, contents: answerComment)
    postContentList[index].answer.insert(newAnswerComment, at:0)
    postContentList[index].answerCount = "\(postContentList[index].answer.count)"
    
}




