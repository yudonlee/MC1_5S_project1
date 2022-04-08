//
//  SearchViewDivView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//  Lena

import SwiftUI

struct SearchViewDivView: View {
    @State var text : String = "" // searchBar에서 텍스트 입력을 받기 위한 변수
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: self.$text)
                SearchResultSectionAnsxwerView(postContents: postContentList)
                
                NavigationLink(destination: SearchView(), label: {
                    MoreButton()})
                
                
                SearchResultSectionNoAnswerView(postContents: postContentList)
                
                MoreButton()
                    .padding(5)
            } // VStack
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } // NavigationView
    }
}

// 상단 searchBar
struct SearchBar: View {
    @Binding var text : String // Binding은 외부에서 값을 바인딩 시킬 수 있음
    @State var editText : Bool = false //택스트필드에 들어갈 값을 저장하기위한 변수
    
    var body: some View {
        HStack{
            TextField("궁금한 것을 물어보세요" , text : self.$text)  // 검색창을 받을 수 있는 택스트필드
                .padding(10)
                .background(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255)) //배경색상 비활성화 배경 색상
                .cornerRadius(8)
            
                // 돋보기 추가
                .overlay(
                    HStack() { // 가로로 view를 쌓을 수 있게
                        Spacer() // 오른쪽 가장자리에 오도록
                        
                        if self.editText{
                            // x 터치하면 입력한 값 취소하고 키 입력 종료
                            Button(action : {
                                self.editText = false
                                self.text = ""
                                // 키보드에서 입력을 끝내게하는 코드
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(.black))
                            }
                        } else {
                            //magnifyingglass 사용
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.black))
                        }
                    }
                        .padding(5)
                ).onTapGesture {
                    self.editText = true
                }
        }
        .padding(.horizontal, 15)
    }
}

// ScrollView + VStack으로 구현
struct SearchResultSectionAnsxwerView: View {
    var postContents: [PostContent]
    var body: some View {
        // title
        HStack {
            Text("답변이 있는 질문")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.333, green: 0.358, blue: 0.362))
                .padding(.bottom, 1)
                .padding(.leading, 15)
            Spacer()
        } // HStack
        
        // content section
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(postContents) { post in
                        HStack {
                            Text("#\(post.name) \n \(post.title) (\(post.answerCount))")
                            Spacer()
                        }
                        Divider()
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                } // VStack
            } // ScrollView
        }
        // border
        .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
        .padding(.horizontal, 15)
        
//        // 더보기 버튼
//        MoreButton().padding(.bottom, 5)
//
//        Divider()
    }
}
struct SearchResultSectionNoAnswerView: View {
    var postContents: [PostContent]
    var body: some View {
        HStack {
            Text("답변이 없는 질문")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.333, green: 0.358, blue: 0.362))
                .padding(.bottom, 1)
                .padding(.leading, 15)
            Spacer()
        } // HStack
        
        // content section
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(postContents) { post in
                        HStack {
                            Text("#\(post.name) \n \(post.title) (0)")
                            Spacer()
                        }
                        Divider()
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                } // VStack
            } // ScrollView
            
            
        }
        // border
        .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
        .padding(.horizontal, 15)
        
//        // 더보기 버튼
//        MoreButton()
//            .padding(.bottom, 5)
    }
}

// 더보기 버튼
struct MoreButton : View {
    var body : some View {
        Text("더보기")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(7)
            .border(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255), width: 1)
            .padding(5)
            .background(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255))
            .cornerRadius(8)
    }
}

struct SearchViewDivView_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewDivView()
    }
}





