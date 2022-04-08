//
//  MyScrapListView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/06.
//

import SwiftUI

struct MyScrapListView: View {
    var postContents: [PostContent]
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
            VStack(spacing: 15) {
                ForEach(postContents) { post in
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
                    Rectangle() //구분선
                        .frame(height: 0.5)
                        .foregroundColor(.gray)
                }
            }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
        }.background(Color.yellow)
        
    }
}

struct MyScrapListView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrapListView(postContents: postContentList)
    }
}
