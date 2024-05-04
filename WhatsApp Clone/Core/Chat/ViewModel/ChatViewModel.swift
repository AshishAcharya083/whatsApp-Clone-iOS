//
//  ChatViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/3/24.
//

import Foundation
import SwiftUI


class ChatViewModel : ObservableObject{
    
    
    @Published var messageText : String  = ""
    @Published var tabBarVisiblity : Visibility = .hidden
}
