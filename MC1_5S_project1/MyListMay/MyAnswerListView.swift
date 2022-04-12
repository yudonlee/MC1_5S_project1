//
//  MyAnswerListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/10.
//

import SwiftUI

struct MyAnswerListView: View {
    @EnvironmentObject var viewModel: postViewModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    ForEach(viewModel.postContents) { post in
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
                            
                        }
                        Divider()
                    }
                }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
            }.background(Color.green)
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyAnswerListView_Previews: PreviewProvider {
    static var previews: some View {
        MyAnswerListView()
    }
}

