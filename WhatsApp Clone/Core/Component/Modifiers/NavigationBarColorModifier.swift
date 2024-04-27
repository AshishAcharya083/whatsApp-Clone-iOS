//
//  NavigationBarColorModifier.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/27/24.
//

import Foundation
import SwiftUI


struct NavigationBarColor : ViewModifier{
    
    var backgroundColor : Color
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
        let coloredAppearence = UINavigationBarAppearance()
        coloredAppearence.backgroundColor = UIColor(backgroundColor)
        UINavigationBar.appearance().standardAppearance = coloredAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearence
        
        
    }
    
    func body(content: Content) -> some View {
        content.background(backgroundColor)
    }
}

extension View{
    func navigationBarColor(backgroundColor: Color) -> some View{
        return modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
}
