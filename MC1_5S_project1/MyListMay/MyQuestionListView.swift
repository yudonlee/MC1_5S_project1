//
//  MyQuestionListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//
//뷰 위치
//피커 연결
//json 내질문, 내답변, 스크랩 골라 오기

import SwiftUI

struct MyQuestionListView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    ForEach(postContentList) { post in
                        let post_index = Int(post.index) ?? 0
                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){MyQuestionContentView(post: post)
                        }.navigationBarTitleDisplayMode(.inline)
                        Divider()
                    }
                }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
            }
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyQuestionContentView: View { //질문 게시글 리스트
    @State var post: PostContent
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(post.name) //작성자 닉네임
                    .bold()
                Text(post.title) //게시글 내용
            }
            Spacer()
            HStack(spacing: 3) {
                Image(systemName: "bubble.right")
                Text(post.answerCount) //댓글 개수
            }
        }.foregroundColor(.black)
            .multilineTextAlignment(.leading)
    }
}

struct MyQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyQuestionListView()
    }
}
 
