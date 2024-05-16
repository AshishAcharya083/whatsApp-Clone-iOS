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
    var body : some View{
        if isFromCurrentUser{
            VStack(alignment:.leading , spacing: -5){
                Text("hello ashish")
                HStack{
                    Text("hello")
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
            .frame(maxWidth: .infinity , alignment: .trailing)
            .padding(.horizontal)
        }else{
            VStack(alignment:.leading , spacing: -5){
                Text("hello ashish")
                HStack{
                    Text("hello")
                        .foregroundStyle(.clear)
                    Text("10:00 AM")
                        .foregroundStyle(Color(.gray))
                        .font(.footnote)
            
                }
            }
            .font(.subheadline)
            .padding(12)
            .background(.white)
            .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding(.horizontal)
        }
    }
}



#Preview {
    ChatMessageCell(isFromCurrentUser: Bool.random())
}
