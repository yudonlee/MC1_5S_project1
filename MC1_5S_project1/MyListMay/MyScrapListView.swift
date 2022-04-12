//
//  MyScrapListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/10.
//

import SwiftUI

struct MyScrapListView: View {
    
    @State var userName = UserInformation.loginUser.name ?? ""
    @State var userScrapCnt: Int = UserInformation.loginUser.data?.scrapList.count ?? 0
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    
                    if let data = UserInformation.loginUser.data {
                        ForEach(data.scrapList, id: \.self) { item in
                        MyScrapContentView(post: postContentList[item]) //샘플
                        }
                    }
                    
//                    ForEach(postContentList.filter {
//                        for sc in 0...userScrapCnt {
//                            Int($0.index) == sc
//                        }
//                    }) { post in
//                        let post_index = Int(post.index) ?? 0
//
//                        //게시글 상세 이동
//                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){
//                            MyScrapContentView(post: post)
//                        }.navigationBarTitleDisplayMode(.inline)
//                        Divider()
//                    }
//                }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                }
            }
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyScrapContentView: View {
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
        }
        .foregroundColor(.black)
        .multilineTextAlignment(.leading)
    }
}

struct MyScrapListView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrapListView()
    }
}

