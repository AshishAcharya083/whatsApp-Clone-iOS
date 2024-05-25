//
//  SettingsView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import SwiftUI

struct SettingsView: View {

    
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: SettingsViewModel = SettingsViewModel()
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                NavigationLink {
                    ProfileView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(alignment:.top, spacing:12){
                        CircularProfileImageView(imageSize: ProfileImageSize.large, user: User.MOCK_USER)
                        
                        VStack(alignment:.leading){
                            Text(User.MOCK_USER.fullName)
                                .font(.title2)
                                .foregroundStyle(Color(.black))
                                .fontWeight(.semibold)
                         
                            Text("Hey there ! I am using WhatsApp")
                                .font(.footnote)
                                .foregroundStyle(Color(.gray))
                        }
                        Spacer()
                    }.padding(.horizontal)
                }.padding(.top)
                
                Divider()
                    .padding(.vertical)
                
                VStack(alignment:.leading ,  spacing:32){
                    ForEach(SettingsOption.allCases){option in
                        Button {
                            if(option == .logout){
                                 Task{
                                     try   viewModel.logOut()
                                }
                            }
                        }label: {
                           
                            HStack(spacing:24){
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.gray)
                                VStack(alignment:.leading){
                                    Text(option.title)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    if option.subtitle != ""{
                                        Text(option.subtitle)
                                            .font(.footnote)
                                            .foregroundStyle(.gray)
                                    }
                                }
                                    
                            }
                        }
                        
                      
                    }
                }.padding(.horizontal)

            }
            .toolbar(viewModel.tabbarVisibility, for: .tabBar)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    HStack{
                        Button{
                            viewModel.tabbarVisibility = .visible
                           dismiss()
                        }label: {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .frame(width: 23, height: 23)
                        }
                        Text("Settings")
                    }.font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Button{
                           dismiss()
                        }label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 23, height: 23)
                        }
                    
                    }.font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
