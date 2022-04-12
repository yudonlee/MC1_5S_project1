//
//  MainTabView.swift
//  MC1_5S_project1
//
//  Created by Lena on 2022/04/11.
//

import Foundation
import SwiftUI

struct MainTabView : View {
    
//    init() {
//        UITableView.appearance().backgroundColor = UIColor(Color(red: 240 / 255, green: 230 / 255, blue: 240 / 255))
//    } // TabView 배경화면 변경
    
    var body: some View {
        TabView {
            QuestionListView()
                .tabItem {
                    Label("질문", systemImage: "pencil")
                        .foregroundColor(.gray)
                        
                }
            
            AnswerCardView()
                .tabItem {
                    Label("답변", systemImage: "character.bubble")
                        .foregroundColor(.gray)
                }
            
            MyPageView()
                .tabItem{
                    Label("My", systemImage: "star")
                        .foregroundColor(.gray)
                }
            
        } //TabView
        .accentColor(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255))
    
    }
}

struct MainTabView_Previews : PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
