//
//  g_QuestionList.swift
//  MC1_5S_project1
//
//  Created by yeekim on 2022/04/11.
//

import SwiftUI

// SwitchOnBest
struct ButtonToAsk : View {
    var body : some View {
        Button(action: {
        }){
            Image(systemName: "square.and.pencil")
                .tint(.gray)
                
        }
    }
}

struct QuestionListView: View {
    @State var searchText = ""
    @State var searching = false
    @State private var selectedSide: itemOfMenu = .myHot
    // items in RoundedRectangle...
    var body: some View {
        NavigationView {
            VStack {
                SearchingInMain(searchText: $searchText, searching: $searching)
                //SelectHotOrNew
                HStack{
                    Picker("", selection: $selectedSide) {
                        ForEach(itemOfMenu.allCases, id:\.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                    
                    ButtonToAsk()
                        .padding(.trailing)
                    
                }
                
                ChosenHotOrNew(selectedSide: selectedSide)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SearchingInMain: View { //검색창
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("질문 검색", text: $searchText) { startEditing in
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
