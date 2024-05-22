//
//  AuthenticationButtonModifier.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/22/24.
//

import Foundation
import SwiftUI

struct AuthenticationButtonModifier : ViewModifier{
    func body(content: Content) -> some View{
        content.foregroundStyle(.white)
            .fontWeight(.semibold)
            .frame(width: 360, height: 44)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
}

extension View{
    func authenticationViewModifier() -> some View{
      return  self.modifier(AuthenticationButtonModifier())
    }
}
