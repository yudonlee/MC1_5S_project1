//
//  g_QuestionList.swift
//  MC1_5S_project1
//
//  Created by yeekim on 2022/04/11.
//

import SwiftUI

struct QuestionListView: View {
    @State var text = ""
    @State var searching = false
    @State private var selectedSide: itemOfMenu = .myHot

    @EnvironmentObject var viewModel: postViewModel

    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    SearchBar(text: $text)
                    NavigationLink(destination:SearchViewDivView(text: text)){
                        Text("검색")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 30.0)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                //SelectHotOrNew
                HStack{
                    Picker("", selection: $selectedSide) {
                        ForEach(itemOfMenu.allCases, id:\.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                    NavigationLink(destination:QuestionCardView()
                        .navigationBarBackButtonHidden(true)){
                            Text("질문하기")
                                .fontWeight(.bold)
                                .foregroundColor(MINTCOLOR)
                                .padding(7)
                                .padding(.trailing, 15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(MINTCOLOR, lineWidth: 1)
                                        .padding(.trailing, 15)
                                )
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                ChosenHotOrNew(selectedSide: selectedSide)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

//struct SearchingInMain: View { //검색창
//    @Binding var searchText: String
//    @Binding var searching: Bool
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .foregroundColor(Color("LightGray"))
//            HStack {
//                Image(systemName: "magnifyingglass")
//                TextField("질문 검색", text: $searchText) { startEditing in
//                    if startEditing {
//                        withAnimation {
//                            searching = true
//                        }
//                    }
//                } onCommit: {
//                    withAnimation {
//                        searching = false
//                    }
//                }
//            }
//            .foregroundColor(.gray)
//            .padding()
//        }
//        .frame(height: 40)
//        .cornerRadius(13)
//    }
//}

enum itemOfMenu: String, CaseIterable {
    case myHot = "Hot"
    case myNew = "New"
}

struct ChosenHotOrNew: View {
    var selectedSide: itemOfMenu

    var body: some View {
        switch selectedSide {
        case .myHot:
            HotQuestionListView()
        case .myNew:
            RecentQuestionListView()
        }
    }
}

struct g_QuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionListView()
    }
}
