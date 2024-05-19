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
                ZStack(alignment:.leading){
                    Text("Email")
                        .foregroundStyle(.gray)
                        .font(.system(.subheadline , design: .rounded))
                        .offset(y:viewModel.email.isEmpty ? 0 : -25)
                    TextField("" , text: $viewModel.email)
                }
                .animation(.default , value: viewModel.email.isEmpty ? 0 : -25)
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
