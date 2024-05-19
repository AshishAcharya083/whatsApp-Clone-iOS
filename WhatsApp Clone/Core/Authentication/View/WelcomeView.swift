//
//  WelcomeView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { proxy in
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
                       
                
                
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Capsule()
                    .fill(Color(.systemGray5))
                    .frame(width: 160, height: 40)
                    .overlay{
                        HStack{
                            Image(systemName: "network")
                            Spacer()
                            Text("English")
                            Spacer()
                            Image(systemName: "chevron.down")
                        }.padding(.horizontal)
                            .foregroundStyle(Color(.darkGray))
                            .font(.subheadline)
                        
                    }.padding(.top , 24)
                Spacer()
                AgreeAndContinueButton(proxy.size.width)
                
                
                
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
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

struct AgreeAndContinueButton: View {
    
    init(_ width: CGFloat) {
        self.width = width
    }
    
    private var width: CGFloat
    
    var body: some View {
        Button{
            
            
            
        }label: {
            Text("Agree and Continue")
            
                .frame(width: width - 80, height: 48)
                .background(Color(.darkGray))
                .foregroundStyle(Color(.white))
                .font(.headline)
                .clipShape(RoundedRectangle(cornerRadius: 26))
        }
    }
}
