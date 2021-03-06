//
//  SearchViewDivView.swift
//  MC1_5S_project1
//
//  Created by 김원희 on 2022/04/06.
//  Lena

import SwiftUI

struct SearchViewDivView: View {
    @State var text: String
    
    var body: some View {
        VStack {
            SearchBar(text: $text)
            
            SearchResultSectionAnswerView(text: $text)
            if text.isEmpty == true {
                VStack {
                    Text("No results")
                    Spacer()
                }
            }
            NavigationLink(destination: SearchAnswerDetailView(text:text), label: {
                AnyButton(buttonText: "more")}
            )
            
            Divider()
                .background(.gray)
            
            SearchResultSectionNoAnswerView(text: $text)
            if text.isEmpty == true {
                VStack {
                    Text("No results")
                    Spacer()
                }
            }
            NavigationLink(destination: SearchNoAnswerDetailView(text:text), label: {
                AnyButton(buttonText: "more")})
            .navigationBarTitleDisplayMode(.inline)
        } // VStack
        .navigationBarTitle("")
//        .navigationBarHidden(true) // 네비게이션 상단 바 없애기
    }
}

// 상단 searchBar
struct SearchBar: View {
    @Binding var text : String // Binding은 외부에서 값을 바인딩 시킬 수 있음
    @State var editText : Bool = false //택스트필드에 들어갈 값을 저장하기위한 변수
    
    var body: some View {
        HStack{
            TextField("Search" , text : self.$text)  // 검색창을 받을 수 있는 택스트필드
                .padding(30)
                .frame(height:40)
                .background(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                .cornerRadius(8)
                            
            // 돋보기 추가
                .overlay(
                    HStack() {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.black))
                        Spacer()
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
                        }
                    } //HStack
                        .padding(5)
                ).onTapGesture {
                    self.editText = true
                }
        }
        .padding(.horizontal, 15)
    }
}

// ScrollView + VStack으로 구현
struct SearchResultSectionAnswerView: View {
    @Binding var text: String
    var body: some View {
        
        // title
        HStack {
            Text("Question with answer")
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
                    ForEach(postContentList.filter {
                        $0.title.contains(text) && $0.answerCount != "0"}) { post in
                            // 검색어가 포함되어 있고, 답글 개수가 0이 아닌 것을 보여준다

                            let post_index = Int(post.index) ?? 0
                            NavigationLink(destination: QuestionDetailView(index: post_index-1)){QuestionContentText(post: post)
                                Divider()
                                }
                            
                    } // Loop
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                }
            } // ScrollView
        } // VStack
        // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 15)
    }
}

struct SearchResultSectionNoAnswerView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Text("Question with no answer")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.333, green: 0.358, blue: 0.362))
                .padding(.vertical, 5)
                .padding(.leading, 15)
            Spacer()
        } // HStack
        
        // content section
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(postContentList.filter {
                        $0.title.contains(text) && $0.answerCount == "0" // 검색어가 포함되어 있고, 답글 개수가 0인 것만 보여준다
                    }) { post in
                        let post_index = Int(post.index) ?? 0
                        NavigationLink(destination: QuestionDetailView(index: post_index-1)){QuestionContentText(post: post)
                            Divider()
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                    } // Loop
                } // VStack
            } // ScrollView
        }
            // border
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 15)
    }
}
    
// 내용을 누르면 NavigationLink를 연결하기 위한 뷰
struct QuestionContentText : View {
    @State var post: PostContent
    var body: some View {
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

        } // HStack
        .foregroundColor(.black)
        .multilineTextAlignment(.leading)
    Spacer()
    }
}

// 범용 버튼
struct AnyButton : View {
    @State var buttonText: String
    var body : some View {
        Text(buttonText)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(4)
            .border(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255), width: 1)
            .padding(5)
            .background(Color(red: 48 / 255, green: 176 / 255, blue: 199 / 255))
            .cornerRadius(15)
    }
}

struct SearchViewDivView_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewDivView(text: " ")
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
