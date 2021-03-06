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
                        
                        let postIdx = Int(post.index) ?? 0
                        //ansSet.insert(postIndex)
                        
                        //게시글 상세 이동
                        NavigationLink(destination: QuestionDetailView(index: postIdx-1)){
                            MyContentView(postIdx: postIdx-1)
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

struct MyContentView: View { //질문 게시글 리스트
    @EnvironmentObject var viewModel: postViewModel

    @State var postIdx: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                if(viewModel.postContents[postIdx].isAnonymous){
                    HStack{
                        Image("lev0")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Unknown")
                            .bold()
                    }
                } else {
                    HStack{
                        if let level = userLevelDic[viewModel.postContents[postIdx].name] {
                            Image("lev\(level)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        Text(viewModel.postContents[postIdx].name) //작성자 닉네임
                            .bold()
                    }
                }
                Text(viewModel.postContents[postIdx].title) // 게시글 내용
//                Text(postContentList[postIdx].title) //게시글 내용
            }
            Spacer()
            HStack(spacing: 3) {
                Image(systemName: "bubble.right")
                Text(viewModel.postContents[postIdx].answerCount)
//                Text(postContentList[postIdx].answerCount) //댓글 개수
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
 
