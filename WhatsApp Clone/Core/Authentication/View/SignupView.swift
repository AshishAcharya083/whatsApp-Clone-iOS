//
//  SignupView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/22/24.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel  = SignupViewModel()
    
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
                FloatingField(title: "Full Name", placeHolder: "", text: $viewModel.fullName)
                FloatingField(title: "Phone Number", placeHolder: "", text: $viewModel.phoneNumber)
                FloatingField(title: "Password", placeHolder: "", text: $viewModel.password)
                
                Button(action: {
                    Task{
                        try await viewModel.createUser()
                    }
                }, label: {
                    Text("Signup")
                        .authenticationViewModifier()
                     
                }).padding(.vertical)
                Spacer()
                Divider()
                HStack{
                    Text("Already have an account ? ")
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Login")
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
    SignupView()
}
