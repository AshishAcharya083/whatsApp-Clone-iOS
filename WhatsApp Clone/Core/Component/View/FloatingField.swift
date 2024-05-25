//
//  FloatingField.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/22/24.
//

import Foundation
import SwiftUI


struct FloatingField: View {
    var title: String
    var placeHolder : String
    @Binding var text : String
    
    var body: some View {
        ZStack(alignment:.leading){
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(.subheadline , design: .rounded))
                .offset(y:text.isEmpty ? 0 : -25)
            VStack{
                if title == "Password"{
                    SecureField(placeHolder , text: $text)
                }else if title == "Phone Number"{
                    TextField(placeHolder , text: $text)
                        .keyboardType(.numberPad)
                }
                else{
                    TextField(placeHolder , text: $text)
                        .textInputAutocapitalization(.never)
                }
                Divider()
            }
            
        }
        .animation(.default , value: text.isEmpty ? 0 : -25)
        .padding()
        .padding(.top , text.isEmpty ? 0 : 18)
    }
}
