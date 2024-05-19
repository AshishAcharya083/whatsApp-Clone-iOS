//
//  WelcomeView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "ellipsis")
                
            }.font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
                .padding()
            
            Image("welcome_image")
                .resizable()
                .clipShape(Circle())
                .frame(width: 300 , height: 300)
                .padding()
            
            Text("Welcome to WhatsApp")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom , 25)
            
    
                
            Text("\(Text("Read our")) \(Text("Privacy Policy").coloredText(.blue)). Tap Agree and continue to accept the \(Text("Terms of Service").coloredText(.blue))")
                   
            
            
                .font(.footnote)
                .foregroundStyle(.gray)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    WelcomeView()
}


extension Text{
    func coloredText(_ color: Color)-> Text{
        return self.foregroundStyle(color)
    }
}
