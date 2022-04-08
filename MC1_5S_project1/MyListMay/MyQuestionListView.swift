//
//  MyQuestionListView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//

import SwiftUI

struct MyQuestionListView: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                profileView()
                MyQList(postContents: postContentList)
            }
        }
    }
//    init() {
//        UITableView.appearance().backgroundColor = .white
//    }
}

enum SideOfMenu: String, CaseIterable {
    case myQuestion = "내 질문"
    case myAnswer = "내 답변"
    case myScrap = "스크랩"
}

//struct ChosenMenuView: View {
//    var selectedSide: SideOfMenu
//
////    var body: some View {
////        switch selectedSide {
////            case .myQuestion:
////
////            case .myAnswer:
////
////            case .myScrap:
////        }
////    }
//}

struct profileView: View { //상단 프로필 화면
    @State private var myMenu = 0
    var body: some View {
        HStack { //프로필 아이콘, 레벨, 닉네임
            Image("apple")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack (alignment: .leading, spacing: 10){
                Text("LV.1")
                Text("오감이")
            }
            Spacer()
            
            HStack (alignment: .top) { //검색,알림 버튼
                Button(action: { //검색 버튼
                    print("검색")
                }){
                    Image(systemName: "magnifyingglass")
                }
                .font(.system(size: 20))
                .foregroundColor(.black)
                
                Button(action: { //알림 버튼
                    print("알림")
                }){
                    Image(systemName: "bell.fill")
                }
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(.leading)
            }
            
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 10))
            .background(Color.mint)
        
        Spacer().frame(height: 10)
        
        //segmented control picker
        Picker("what menu?", selection: $myMenu) {
            Text("내 질문").tag(0)
            Text("내 답변").tag(1)
            Text("스크랩").tag(2)
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

struct MyQList: View { //내 질문 리스트
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
        }
        
    }
}

struct MyQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyQuestionListView()
    }
}
