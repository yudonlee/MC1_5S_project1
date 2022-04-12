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
    
    
    @StateObject var viewModel = postViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Image("Logo")
                    .resizable()
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                    .aspectRatio(contentMode: .fit)
                
                //                .frame(width: 100, height: 100)
                //                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 24){
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
                HStack(alignment: .center) {
                    NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true)
                    ) {

                        Text("로그인")
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
                    }) {
                        Text("회원가입")
                            .padding(7)
                            .foregroundColor(.white)
                            .background(appMainColor)
                            .cornerRadius(7)
                    }
                }
                
        
            }
            
        }.environmentObject(viewModel)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
