//
//  NewMessageView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/28/24.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    ContactView(imageName: "person.2.circle.fill", title: "New Group")
                    ContactView(imageName: "person.circle.fill", title: "New Contact")
                    ContactView(imageName: "shared.with.you.circle.fill", title: "New Community")
                    Text("Contacts on WhatsApp")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .padding(EdgeInsets(top: 8 , leading: 0 , bottom: 0 , trailing: 0))
                        .fontWeight(.semibold)
                        .font(.footnote)
                    ForEach(0 ..< 5){
                        _ in
                        HStack{
                            CircularProfileImageView(imageSize: ProfileImageSize.small , user: User.MOCK_USER)
                            VStack(alignment:.leading){
                                Text(User.MOCK_USER.fullName)
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                Text("Hi There, I'am using WhatsApp")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }.padding(.bottom , 20)
                    }
                    
                    
                }.padding(.top)
                    .padding(.horizontal)
            }.toolbar{
                ToolbarItem(placement:.topBarLeading){
                    HStack(spacing:16){
                        Button(action: {
                            dismiss()
                        } , label: {
                            Image(systemName: "arrow.backward")
                        })
                        VStack(alignment:.leading){
                            Text("Select Contact")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("2 contacts")
                                .font(.caption2)
                            
                        }
                    }.foregroundColor(.white)
                        .navigationBarColor(backgroundColor: Color(.darkGray))
                }
                ToolbarItem(placement:.topBarTrailing){
                    HStack(spacing:24){
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "ellipsis")
                    }.foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
            }
        }
    }
}

#Preview {
    NewMessageView()
}


