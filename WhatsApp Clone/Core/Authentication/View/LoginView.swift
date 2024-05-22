//
//  LoginView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                FloatingField(title: "Email", placeHolder: "", text: $viewModel.email)
                FloatingField(title: "Password", placeHolder: "", text: $viewModel.passowrd)
            
                        Text("Forgot Password ?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.trailing)
                            .frame(maxWidth: .infinity , alignment: .trailing)
                            .padding(.top)
                    
                Button(action: {}, label: {
                    Text("Login")
                        .authenticationViewModifier()
                        
                     
                }).padding(.vertical)
                
                Spacer()
                Divider()
                HStack{
                    Text("Don't have an account ? ")
                    NavigationLink {
                        SignupView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }

                }.padding(.vertical)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    LoginView()
}


