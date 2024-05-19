//
//  Message.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/18/24.
//

import Foundation


struct Message : Identifiable , Hashable , Codable{
//    var id: ObjectIdentifier
    let fromId: String
    let told: String
    let messageText : String
//    let timeStamp: TimeStamp
    let image: Bool
    let isAudio: Bool
    let isVideo: Bool
    let user: User?
    var id = UUID().uuidString
    
}


struct MessageGroup : Identifiable , Hashable{
    var id = UUID().uuidString
    var messages: [Message]
    let date : Date
}


extension MessageGroup{
     static let mockMessageModel : Message = Message(fromId: "1", told: "2", messageText: "Hello, How are you ? ", image: false, isAudio: false, isVideo: false, user: User.MOCK_USER)
    
    static var MOCK_MESSAGE_GROUP = [MessageGroup(messages: [mockMessageModel] , date: Date())]
}
