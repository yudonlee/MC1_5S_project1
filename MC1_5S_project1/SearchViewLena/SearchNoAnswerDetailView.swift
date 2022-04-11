//
//  SearchView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct SearchNoAnswerDetailView: View {
    @State var text : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: self.$text)
                SearchResultNoAnswerDetailView(postContents: postContentList)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SearchResultNoAnswerDetailView: View {
    var postContents: [PostContent]
    var body: some View {
        // title
        HStack {
            Text("답변이 없는 질문")
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
                        let post_index = Int(post.index) ?? 0
                        NavigationLink(destination: QuestionDetailView(index: post_index-1)) {QuestionContentText(post: post)
                        }.navigationBarTitleDisplayMode(.inline)
                        
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        Divider()
                    } // Loop
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

struct SearchNoAnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNoAnswerDetailView()
    }
}

