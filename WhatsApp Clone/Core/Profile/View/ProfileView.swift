//
//  ProfileView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/18/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var profileViewModel : ProfileViewModel = ProfileViewModel()
    
   
    
    var body: some View {
        VStack{
            Button {
                profileViewModel.showPhotoPicker.toggle()
            } label: {
                ZStack(alignment:.bottomTrailing){
                    ZStack{
                        CircularProfileImageView(imageSize: .xxlarge, user: User.MOCK_USER)
                        if let profileImage = profileViewModel.profileImage{
                            
                            profileImage
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                    }
                  
                  
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color(.darkGray))
                        .overlay{
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.white)
                        
                        }
                    
                   
               
                }
            }

     
            VStack(alignment:.leading ,  spacing:32){
                OptionView(imageName: "person.fill", title: "Name", subtitle: User.MOCK_USER.fullName ,  secondSubtitle: "This is not your username or pin. This name will be visible to your WhastaApp contacts." , isEditable: true  )
                
                OptionView(imageName: "exclamationmark.circle", title: "About", subtitle: "Hey there ! I'am using WhatsApp", secondSubtitle: nil , isEditable: true)
                
                OptionView(imageName: "phone.fill", title: "Phone", subtitle: User.MOCK_USER.phoneNumber, secondSubtitle: nil)
            }
            Spacer()
        }
        .toolbar(profileViewModel.tabbarVisibility, for: .tabBar)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                HStack{
                   
                    Button{
                        dismiss()
                        profileViewModel.tabbarVisibility = .visible
                    }label: {
                        Image(systemName: "arrow.backward")
                    }
        
                    Text("Profile")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
            }
        }
        .photosPicker(isPresented: $profileViewModel.showPhotoPicker, selection: $profileViewModel.selectedImage)
    }
}

#Preview {
    ProfileView()
}

struct OptionView: View {
    
    private var imageName: String
    private var title: String
    private var subtitle: String
    private var isEditable: Bool = false
    private var secondSubtitle : String?
    
    init(imageName: String, title: String, subtitle: String , secondSubtitle: String? ) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.secondSubtitle = secondSubtitle
        
    }
    
    init(imageName: String, title: String, subtitle: String, secondSubtitle: String? ,   isEditable: Bool) {
     
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.isEditable = isEditable
        self.secondSubtitle = secondSubtitle
    }
    
    var body: some View {
        HStack(alignment: secondSubtitle != nil ? .top : .center ,  spacing:20){
            Image(systemName: imageName)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(.gray)
                .padding(.top , secondSubtitle != nil ? 12 : 0)
            //                        .padding(.horizontal , 24)
            
            VStack(alignment:.leading){
                Text(title)
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.footnote)
                if secondSubtitle != nil {
                    Text(secondSubtitle!)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
               
                
                
            }
Spacer()
            if isEditable {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .scaledToFill()
                    .foregroundStyle(.gray)
            }
          
        }.padding(.horizontal , 16)
    }
}
