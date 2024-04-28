//
//  InboxRowView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/27/24.
//

import SwiftUI

struct InboxRowView: View {
    
    var width : CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        HStack{
            CircularProfileImageView(imageSize: ProfileImageSize.medium , user: User.MOCK_USER)
            
            VStack(alignment:.leading , spacing: 4){
                Text("User Name")
                    .fontWeight(.semibold)
                   
                Text("Hello My Friend")
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: width - 100, alignment: .leading)
                  
                
            } .font(.subheadline)
            HStack(alignment:.top){
                Text("2020/12/30")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }.frame(height:72)
    }
}

#Preview {
    InboxRowView(width: 300)
}
