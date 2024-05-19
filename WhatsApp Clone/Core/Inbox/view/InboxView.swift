//
//  InboxView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/27/24.
//

import Foundation
import SwiftUI

struct InboxView : View{
    @ObservedObject var inboxViewModel : InboxViewModel = InboxViewModel()
    var body : some View{
       
        GeometryReader { proxy in
            NavigationStack{
                ZStack(alignment: .bottomTrailing){
                    List{
                        ForEach(0 ..< 5){
                            _ in
                            NavigationLink{
                                ChatView()
                                    .navigationBarBackButtonHidden()
                            }label: {
                                InboxRowView(width: proxy.size.width )
                            }
                            
                           
                        }
                    }.listStyle(PlainListStyle())
                    
                    Button(action: {
                        inboxViewModel.showNewMessage.toggle()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color(.darkGray)).frame(width: 50 , height: 50).padding()
                            .overlay{
                            Image(systemName: "plus.bubble.fill").foregroundColor(.white)
                        }
                    })
                    
                }
                .fullScreenCover(isPresented: $inboxViewModel.showNewMessage, content: {
                    NewMessageView()
                })
                .toolbar{
                    ToolbarItem(placement:.topBarLeading){
                        Text("WhatsApp").font(.title).fontWeight(.semibold).foregroundColor(.white)
                            .navigationBarColor(backgroundColor: Color(.darkGray))
                    }
                    
                    ToolbarItem(placement:.topBarTrailing){
                        HStack(spacing:20){
                            Image(systemName: "camera")
                            Image(systemName: "magnifyingglass")
                            NavigationLink {
                                ProfileView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Image(systemName: "ellipsis")
                            }

                        }.fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                    }
                   
                    
                }
            }
        }
    }
}


#Preview{
    InboxView()
}
