//
//  ChatMessageCell.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/8/24.
//

import Foundation
import SwiftUI

struct ChatMessageCell : View{
    let isFromCurrentUser : Bool
    let message: Message
    var body : some View{
        if isFromCurrentUser{
            HStack ( spacing:8 ){
                
                VStack(alignment:.leading , spacing: -5){
                    Text(message.messageText)
                    HStack{
                        Text(message.messageText)
                            .foregroundStyle(.clear)
                        Text("10:00 AM")
                            .foregroundStyle(Color(.gray))
                            .font(.footnote)
                
                    }
                }
               
                .font(.subheadline)
                .padding(12)
                .background(Color("Peach"))
                .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                CircularProfileImageView(imageSize: .xsmall, user: User.MOCK_USER)
          
            
            }
            .frame(maxWidth: .infinity , alignment: .trailing)
            .padding(.horizontal)
        }else{
            HStack (spacing:8){
                CircularProfileImageView(imageSize: .xsmall, user: User.MOCK_USER)
                VStack(alignment:.leading , spacing: -5){
                    Text(message.messageText)
                    HStack{
                        Text(message.messageText)
                            .foregroundStyle(.clear)
                        Text("10:00 AM")
                            .foregroundStyle(Color(.gray))
                            .font(.footnote)
                
                    }
                }
                .font(.subheadline)
                .padding(12)
                .background(Color("Peach"))
                .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                .frame(maxWidth: .infinity , alignment: .leading)
         
            
            }.padding(.horizontal)
        }
    }
}



#Preview {
    ChatMessageCell(isFromCurrentUser: Bool.random() , message:MessageGroup.MOCK_MESSAGE_GROUP.first!.messages.first! )
}
