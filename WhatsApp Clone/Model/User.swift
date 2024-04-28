//
//  User.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/28/24.
//

import Foundation


struct User : Codable , Hashable , Identifiable{
    
    var id: String = UUID().uuidString
    let fullName: String
    let email: String
    let phoneNumber : String
    let profileImageUrl: String?
    
    
}


extension User{
    static let MOCK_USER = User(fullName: "Ashish Acharya", email: "imashish083@gmail.com", phoneNumber: "9829292929", profileImageUrl: "elizabeth")
}
