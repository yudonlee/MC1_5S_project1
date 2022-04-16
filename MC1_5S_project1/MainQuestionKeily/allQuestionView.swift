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
        NavigationView{
            VStack {
                HStack{
                    SearchBar(text: $text)
                    NavigationLink(destination:SearchViewDivView(text: text), label: {
                        FindButton(buttonText: "Search")
                    })
                }
                //SelectHotOrNew
                HStack{
                    Picker("", selection: $selectedSide) {
                        ForEach(itemOfMenu.allCases, id:\.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                    //질문하기(버튼)으로 링크걸기
                    NavigationLink(destination:QuestionCardView(), label: {
                        AddQuestionButton(buttonText: "Ask")
                    })
                    .navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                    ChosenHotOrNew(selectedSide: selectedSide)
            } // VStack
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } //NavigationView
    }
}

struct AddQuestionButton : View {
    @State var buttonText: String
    var body : some View {
        Text(buttonText)
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
}

struct FindButton : View {
    @State var buttonText: String
    var body : some View {
        Text(buttonText)
            .fontWeight(.semibold)
            .foregroundColor(Color.gray)
            .padding(.trailing, 30.0)
    }
}

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
