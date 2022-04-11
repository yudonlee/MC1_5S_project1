//
//  SignInView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/11.
//

import SwiftUI

func obj() {
    print("3")
}
struct SignInView: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var isSignInSuccess: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //                .frame(width: 100, height: 100)
                //                .clipShape(Circle())
                
                TextField("username", text: $id)
                    .padding()
                    .background(.gray)
                    .cornerRadius(19)
                SecureField("password", text: $password)
                    .padding()
                    .background(.gray)
                    .cornerRadius(19)
                
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
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
