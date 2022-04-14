//
//  MyScrapListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/10.
//

import SwiftUI

struct MyScrapListView: View {
    
    @EnvironmentObject var viewModel: postViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    
                    if let data = UserInformation.loginUser.data {
                        ForEach(data.scrapList, id: \.self){ item in
                            ForEach(viewModel.postContents.filter {
                                Int($0.index) == item
                            }) { post in
                                let postIdx = Int(post.index) ?? 0
                                
                                NavigationLink(destination: QuestionDetailView(index: postIdx-1)){
                                    MyContentView(postIdx: postIdx-1)
//                                    MyContentView(post: post)
                                }.navigationBarTitleDisplayMode(.inline)
                                Divider()
                            }
                        }
                        .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                    }
                    
//                    ForEach(viewModel.postContents){ post in
//                        ForEach(post.answer.filter{
//                            $0.name == UserInformation.loginUser.name
//                        }) { item in
//                            let post_index = Int(post.index) ?? 0
//
//                            NavigationLink(destination: QuestionDetailView(index: post_index-1)){
//                                MyAnswerContentView(post: post)
//                            }.navigationBarTitleDisplayMode(.inline)
//                            Divider()
//                        }
//                    }
//                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                    
//                    if let data = UserInformation.loginUser.data {
//                        ForEach(data.scrapList, id: \.self) { item in
//                            MyScrapContentView(post: viewModel.postContents[item]) //샘플
//                        }
//                    }
                }
            }
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyScrapListView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrapListView()
    }
}

