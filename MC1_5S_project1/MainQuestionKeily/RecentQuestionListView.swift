//
//  RecentQuestionListView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

//struct RecentQuestionListLink: View {
//    var body: some View {
//        VStack {
//            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
//                VStack(spacing: 15) {
//                    ForEach(postContentList) { post in
//                        let post_index = Int(post.index) ?? 0
//                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){MyQuestionContentView(post: post)
//                        }.navigationBarTitleDisplayMode(.inline)
//                        Divider()
//                    }
//                }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
//            }
//        }
//    }
//}

struct RecentQuestionListView: View {
    @EnvironmentObject var viewModel: postViewModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack{
                    ForEach(viewModel.postContents) {
                        post in
                        let post_index = Int(post.index) ?? 0 //string to int
                        //내용과 링크 한 화면에 두기
                        ZStack{
                            HStack {
                                VStack(alignment:.leading, spacing: 10) {
                                    Text(post.name) //작성자 닉네임
                                        .bold()
                                    Text(post.title) //게시글 내용
                                }
                                Spacer()
                                HStack(spacing: 3) {
                                    Image(systemName: "bubble.right")
                                    Text(post.answerCount) //댓글 개수
                                }
                            }
                            NavigationLink(destination: QuestionDetailView(index: post_index-1)){MyQuestionContentView(post: post)
                            }.navigationBarTitleDisplayMode(.inline)
                        }
                        Divider()
                    }
                }
                .padding(.all, 15)
                .background(Color.yellow) // 구분색 (삭제예정)
            }
            // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding([.leading, .bottom, .trailing], 15)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct RecentQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentQuestionListView()
    }
}
