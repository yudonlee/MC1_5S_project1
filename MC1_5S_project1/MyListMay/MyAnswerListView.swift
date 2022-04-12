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
                    ForEach(viewModel.postContents){ post in
                        ForEach(post.answer.filter{
                            $0.name == UserInformation.loginUser.name
                        }) { item in
                            let post_index = Int(post.index) ?? 0
                            
                            NavigationLink(destination: QuestionDetailView(index: post_index-1)){
                                MyContentView(post: post)
                            }.navigationBarTitleDisplayMode(.inline)
                            Divider()
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                    
//                    ForEach(viewModel.postContents.filter{ //연구 대상
//                        $0.name == UserInformation.loginUser.name
//                    }) { post in
//                        let post_index = Int(post.index) ?? 0
//
//                        //게시글 상세 이동
//                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){
//                            MyAnswerContentView(post: post)
//                        }.navigationBarTitleDisplayMode(.inline)
//                        Divider()
//                    }
                } //Vstack
                
            } //ScrollView
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

//struct MyAnswerContentView: View { //질문 게시글 리스트
//    @EnvironmentObject var viewModel: postViewModel
//
//    @State var post: PostContent
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 10) {
//                if(post.isAnonymous){
//                    Text("익명")
//                        .bold()
//                } else {
//                    Text(post.name) //작성자 닉네임
//                        .bold()
//                }
//                Text(post.title) //게시글 내용
//            }
//            Spacer()
//            HStack(spacing: 3) {
//                Image(systemName: "bubble.right")
//                Text(post.answerCount) //댓글 개수
//            }
//        }.foregroundColor(.black)
//            .multilineTextAlignment(.leading)
//    }
//}


struct MyAnswerListView_Previews: PreviewProvider {
    static var previews: some View {
        MyAnswerListView()
    }
}

