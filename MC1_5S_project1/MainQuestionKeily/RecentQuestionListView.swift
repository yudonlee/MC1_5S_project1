//
//  RecentQuestionListView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct RecentQuestionListView: View {

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack{
                        ForEach(postContentList) {
                            post in
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
                                Divider()
                            }
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
}


struct RecentQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentQuestionListView()
    }
}
