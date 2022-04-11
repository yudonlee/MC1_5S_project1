//
//  SignInView.swift
//  MC1_5S_project1
//
//  Created by yudonlee on 2022/04/11.
//

import SwiftUI

struct SignInView: View {
    @State var id: String = ""
    @State var password: String = ""
    
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
                    Button(action: {
                        if  UserInformation.loginUser.isPasswordRight(id: id, inputPassword: password) {
//                            Lena가 할 부분
//                            NavigationLink(<#T##title: StringProtocol##StringProtocol#>, destination: <#T##() -> _#>)
                        }
                    }) {
                        Text("로그인")
                            .padding(7)
                            .foregroundColor(.white)
                            .background(appMainColor)
                            .cornerRadius(7)
                    }
                    //                Spacer()
                    Button(action: {
                        print("login")
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
