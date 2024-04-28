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
                
            }
        }
    }
}

#Preview {
    NewMessageView()
}
