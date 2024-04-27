//
//  InboxView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/27/24.
//

import Foundation
import SwiftUI

struct InboxView : View{
    var body : some View{
       
        NavigationStack{
            ZStack(alignment: .bottomTrailing){
                List{
                    ForEach(0 ..< 5){
                        _ in
                        Text("Ashish")
                    }
                }.listStyle(PlainListStyle())
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color(.darkGray)).frame(width: 50 , height: 50).padding().overlay{
                        Image(systemName: "plus.bubble.fill").foregroundColor(.white)
                    }
                })
                
            }.toolbar{
                ToolbarItem(placement:.topBarLeading){
                    Text("WhatsApp").font(.largeTitle).fontWeight(.semibold)
                }
              
             
                    ToolbarItem(placement:.topBarTrailing){
                        HStack(spacing:20){
                            Image(systemName: "camera")
                            Image(systemName: "magnifyingglass")
                            Image(systemName: "ellipsis")
                        }.fontWeight(.semibold)
                       
                        
                    }
                
    
               
            }
        }
    }
}


#Preview{
    InboxView()
}
