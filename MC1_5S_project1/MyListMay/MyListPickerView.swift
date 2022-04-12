//
//  MyListPickerView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/08.
//

import SwiftUI

struct MyListPickerView: View {
    
    @State var searchText = ""

    @State private var selectedSide: SideOfMenu = .myQues
    @State var text : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Searching(text: $searchText)
                    .padding(.top, -10)
                    .padding(15)
                
                Picker("Choose a menu", selection: $selectedSide) {
                    ForEach(SideOfMenu.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
                ChosenView(selectedSide: selectedSide)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct Searching: View {
    @Binding var text: String
    @State private var isEditing = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        
        HStack {
            TextField("검색", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(.white)
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
        } // Hstack
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                
                if isEditing { // x를 누르면 내용을 지우고 키보드를 숨긴다
                    Button(action: {
                        self.text = ""
                        hideKeyboard()
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                }
            } // HStack
        ) //overlay
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
            MyQuestionListView()
        case .myAns:
            MyAnswerListView()
        case .myScr:
            MyScrapListView()
        }
    }
}

struct MyListPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyListPickerView()
    }
}


// 키보드를 닫기 위해 UIKit에서 불러온다
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

