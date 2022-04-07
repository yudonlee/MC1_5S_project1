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
                
                List(questionLists){ list in
                    QuestionView(list: list)
                }
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
            
        }.padding()
        
        //segmented control
        Picker("what menu?", selection: $myMenu) {
            Text("내 질문").tag(0)
            Text("내 답변").tag(1)
            Text("스크랩").tag(2)
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

//게시글 샘플 데이터
let questionLists = [
    QuestionList(name: "익명", title: "사진 촬영 동의서 부모님 서명 필요한가요?", answerCount: "0"),
    QuestionList(name: "익명", title: "오늘 점심은 다들 뭐 드시나요?", answerCount: "10"),
    QuestionList(name: "익명", title: "기숙사에 택배 부쳐도 되나요?", answerCount: "3"),
    QuestionList(name: "익명", title: "미로에서 코멘트 어떻게 남기나요?", answerCount: "0"),
    QuestionList(name: "오감이", title: "프로젝트 하는데 너무 힘들어요ㅠㅠ 다들 어떻게 진행하시나요?", answerCount: "1")
]

struct QuestionList: Identifiable {
    let id = UUID()
    let name: String
    let title: String
    let answerCount: String
}

struct QuestionView: View { //리스트 항목별 화면 구성
    var list: QuestionList
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(list.name) //작성자 닉네임
                Text(list.title) //게시글 내용
                    .bold()
            }
            Spacer()
            Text("("+list.answerCount+")") //댓글 개수
        }
    }
}

struct MyQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyQuestionListView()
    }
}
