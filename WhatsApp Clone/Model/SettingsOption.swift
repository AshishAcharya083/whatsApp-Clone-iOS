//
//  SettingsOption.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import Foundation
import SwiftUI


enum SettingsOption : Int ,  CaseIterable , Identifiable {
    var id: Int  {return self.rawValue}
    
    
    case account
    case privacy
    case avatar
    case chats
    case notifications
    case storageAndData
    case appLaungage
    case help
    case inviteFriend
    case logout
    var title: String{
        switch self {
        case .account:
            return "Account"
        case .privacy:
            return "Privacy"
        case .avatar:
            return "Avatar"
        case .chats:
            return "Chats"
        case .notifications:
            return"Notification"
        case .storageAndData:
            return"Storage and Data"
        case .appLaungage:
            return "App Language"
        case .help:
            return "Help"
        case .inviteFriend:
            return"Invite a Friend"
        case .logout:
            return"Logout"
        }
    }
    
    var subtitle:String{
        switch self {
        case .account:
            return "Security notifications , change number"
        case .privacy:
            return "Block contacts, disappearing messages"
        case .avatar:
           return  "create, edit profile photo"
        case .chats:
            return "Theme, wallpapers , chat history"
        case .notifications:
            return "Message , group & call tones"
        case .storageAndData:
            return "Network usage , auto-download"
        case .appLaungage:
            return "English (device's language)"
        case .help:
            return "help centre, contact us , privacy policy"
        case .inviteFriend:
            return ""
        case .logout:
            return ""
        }
        
    }
    var imageName: String{
        switch self {
        case .account:
            return "key.fill"
        case .privacy:
            return "lock.fill"
        case .avatar:
            return "face.smiling.inverse"
        case .chats:
            return "text.bubble.fill"
        case .notifications:
            return "bell.fill"
        case .storageAndData:
            return "circle.dotted.circle.fill"
        case .appLaungage:
            return "map.circle.fill"
        case .help:
            return "questionmark.circle"
        case .inviteFriend:
            return "person.2.fill"
        case .logout:
            return "rectangle.portrait.and.arrow.right.fill"
        }
    }
}
