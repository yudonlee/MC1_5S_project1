//
//  SignInView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/11.
//

import SwiftUI

let lightgray = Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255)

struct SignInView: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var isSignInSuccess: Bool = false
    
    
//    무작정 선언은 불가능하다. ObservableObject를 따라하면 @StateObject, @ObservedObject property wrapper를 사용할 수 있다. 
//    @ObservedObject private var postFileName: String
//    @StateObject private var postFIleName: String
    
    @StateObject var viewModel = postViewModel(jsonFileName: "posts.json")
    var viewModelTwo = postViewModel(jsonFileName: "posts.json")
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
//                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                    .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                //                .clipShape(Circle())
                VStack(alignment: .leading, spacing: 15){
                    TextField("username", text: $id)
                        .padding(15)
                        .background(lightgray)
                        .cornerRadius(19)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                    SecureField("password", text: $password)
                        .padding(15)
                        .background(lightgray)
                        .cornerRadius(19)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                    
                }
                .padding((EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)))
                HStack(alignment: .center) {
                    NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true)
                    ) {

                        Text("SignIn")
                            .padding(7)
                            .foregroundColor(.white)
                            .background(appMainColor)
                            .cornerRadius(7)

                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("")
                    .disabled(!UserInformation.loginUser.isPasswordRight(id: id, inputPassword: password))

                    
//                    파스타 참고 버튼
//                    Button("로그인"){
//                        if  UserInformation.loginUser.isPasswordRight(id: id, inputPassword: password) {
//                            isSignInSuccess = true
//                        } else {
//                            isSignInSuccess = false
//                        }
//                        obj()
//                    }
//                    .sheet(isPresented: $isSignInSuccess) {
//                        MainTabView()
//                    }
                    //                Spacer()
                    Button(action: {
                        print("SignUp")
//                        viewModel.objectWillChange.send()
                    }) {
                        Text("SignUp")
                            .padding(7)
                            .foregroundColor(.white)
                            .background(appMainColor)
                            .cornerRadius(7)
                    }
                }
                .padding((EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)))
                
                Text(viewModelTwo.postContents[1].answerCount)
            }
            
        }.environmentObject(viewModel)
            .onAppear(perform: loadUserLevel)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
