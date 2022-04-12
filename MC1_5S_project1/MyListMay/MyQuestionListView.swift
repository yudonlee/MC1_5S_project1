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
    @EnvironmentObject var viewModel: postViewModel

    @State var userName = UserInformation.loginUser.name ?? ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true){ //막대바 숨김-false
                VStack(spacing: 15) {
                    ForEach(viewModel.postContents.filter{ //연구 대상
                        $0.name == userName
                    }) { post in
                        let post_index = Int(post.index) ?? 0
                        
                        //게시글 상세 이동
                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){
                            MyQuestionContentView(postIdx: post_index-1)
//                            MyContentView(post: post)
                        }.navigationBarTitleDisplayMode(.inline)
                        Divider()
                    }
                } //Vstack
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
            }
        }.overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}

struct MyQuestionContentView: View { //질문 게시글 리스트
    @EnvironmentObject var viewModel: postViewModel

    @State var postIdx: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                if(postContentList[postIdx].isAnonymous){
                    Text("익명")
                        .bold()
                } else {
                    Text(postContentList[postIdx].name) //작성자 닉네임
                        .bold()
                }
                Text(postContentList[postIdx].title) //게시글 내용
            }
            Spacer()
            HStack(spacing: 3) {
                Image(systemName: "bubble.right")
                Text(postContentList[postIdx].answerCount) //댓글 개수
            }
        }.foregroundColor(.black)
            .multilineTextAlignment(.leading)
    }
}

struct MyContentView: View { //게시글 리스트
    @EnvironmentObject var viewModel: postViewModel

    @State var post: PostContent
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                if(post.isAnonymous){
                    Text("익명")
                        .bold()
                } else {
                    Text(post.name) //작성자 닉네임
                        .bold()
                }
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
 
