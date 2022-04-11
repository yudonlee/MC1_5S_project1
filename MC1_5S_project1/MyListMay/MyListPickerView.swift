//
//  MyListPickerView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/08.
//

import SwiftUI

struct MyListPickerView: View {
    
    @State var searchText = ""
    @State var searching = false
    
    @State private var selectedSide: SideOfMenu = .myQues
    var body: some View {
        NavigationView {
            VStack {
                Searching(searchText: $searchText, searching: $searching)
                
                Picker("Choose a menu", selection: $selectedSide) {
                    ForEach(SideOfMenu.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
                ChosenView(selectedSide: selectedSide)
            }
            .navigationBarTitle("") .navigationBarHidden(true)
        }
    }
}

struct Searching: View { //마이페이지 검색창
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("내질문/내답변/스크랩 검색", text: $searchText) { startEditing in
                    if startEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding()
        }
        .frame(height: 40)
        .cornerRadius(13)
    }
}

enum SideOfMenu: String, CaseIterable {
    case myQues = "내 질문"
    case myAns = "내 답변"
    case myScr = "스크랩"
}

struct ChosenView: View {
    var selectedSide: SideOfMenu

    var body: some View {
        switch selectedSide {
        case .myQues:
            MyQuestionListView(postContents: postContentList)
        case .myAns:
            MyAnswerListView(postContents: postContentList)
        case .myScr:
            MyScrapListView(postContents: postContentList)
        }
    }
}

struct MyListPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyListPickerView()
    }
}
