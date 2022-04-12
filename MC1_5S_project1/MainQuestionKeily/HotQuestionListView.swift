//
//  HotQuestionListView.swift
//  MC1_5S_project1
//
//  Created by Keily on 2022/04/06.
//

import SwiftUI

struct HotQuestionListView: View {
    @EnvironmentObject var viewModel: postViewModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack{
                    ForEach(viewModel.postContents) {
                        post in
                        let post_index = Int(post.index) ?? 0
                        //내용과 링크 한 화면에 두기
                        ZStack{
                            /*
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
                            }*/
                            NavigationLink(destination: QuestionDetailView(index: post_index-1)){
//                                케일리한테 물어볼 부분
//                                MyContentView(post: post)
                                MyQuestionContentView(postIdx: post_index - 1)
                            }.navigationBarTitleDisplayMode(.inline)
                        }
                        Divider()
                    }
                }
                .padding(.all, 15)
            }
            // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding([.leading, .bottom, .trailing], 15)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HotQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        HotQuestionListView()
    }
}
