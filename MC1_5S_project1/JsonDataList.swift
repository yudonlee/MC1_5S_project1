//
//  PostData.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/07.
//

import Foundation

var postContentList: [PostContent] = load("posts.json")
var userProfileList: [UserProfile] = load("users.json")



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

func addNewContent(comment: String,
                   name: String, certifiedUser: Bool, isAnonymous: Bool) {
    let index = String(postContentList.count)
    var new_post:PostContent = PostContent(
        answer: [Answer]()
        title: comment,
        name: "미정",
        index: index,
        certifiedUser: certifiedUser,
        isAnonymous: isAnonymous,
        answerCount: "0")
    postContentList.append(new_post)
}
