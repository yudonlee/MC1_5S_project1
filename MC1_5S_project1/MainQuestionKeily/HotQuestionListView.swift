//
//  HotQuestionListView.swift
//  MC1_5S_project1
//
//  Created by Keily on 2022/04/06.
//

import SwiftUI

// SwitchOnBest
struct ButtonToAsk : View {
    var body : some View {
        Button(action: {
        }){
            Image(systemName: "square.and.pencil")
        }
    }
}

struct HotQuestionListView: View {
    @State private var myMenu = 0
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    // items in RoundedRectangle...
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                //SelectHotOrNew
                HStack{
                    Picker("", selection: $myMenu) {
                        Text("Hot").tag(0)
                        Text("New").tag(1)
                    }
                    .frame(width: 250, height:40)
                    .pickerStyle(.segmented)
                    .offset(x: -23)
                    ButtonToAsk()
                }
                ScrollView(.vertical) {
                    ForEach(postContentList) {
                        answer in
                        VStack(alignment:.leading) {
                            HStack(spacing: 3) {
                                Text("[\(answer.name)]\t" + answer.title)
                                Spacer()
                                Image(systemName: "bubble.right")
                                Text(answer.answerCount) //댓글 개수
                            }
                            Divider()
                        }
                    }.searchable(text: /*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic)
                    .padding(.all, 15)
                        
                }
                // border
                .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
                .padding([.leading, .bottom, .trailing], 15)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HotQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        HotQuestionListView()
    }
}
