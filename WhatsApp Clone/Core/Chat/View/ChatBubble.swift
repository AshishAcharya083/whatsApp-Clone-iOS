//
//  ChatBubble.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/16/24.
//

import Foundation
import SwiftUI


struct ChatBubble : Shape{
    
    
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: isFromCurrentUser ?  [.topRight , .topLeft , .bottomLeft] : [.topRight , .topLeft , .bottomRight] , cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
    
}
