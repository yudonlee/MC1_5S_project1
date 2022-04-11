//
//  SearchView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct SearchAnswerDetailView: View {
    @State var text : String = ""

    var body: some View {
        VStack {
            SearchBar(text: self.$text)
            SearchResultAnswerDetailView(postContents: postContentList)

        }
    }
}

struct SearchResultAnswerDetailView: View {
    var postContents: [PostContent]
    var body: some View {
        // title
        HStack {
            Text("답변이 있는 질문")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.333, green: 0.358, blue: 0.362))
                .padding(.bottom, 1)
                .padding(.leading, 15)
            Spacer()
        } // HStack
        
        // content section
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(postContents) { post in
                        HStack {
                            Text("#\(post.name) \n \(post.title) (\(post.answerCount))")
                            Spacer()
                        }
                        Divider()
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                } // VStack
            } // ScrollView
        }
        // border
        .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
        .padding(.horizontal, 15)
    }
}
        
struct SearchAnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAnswerDetailView()
    }
}