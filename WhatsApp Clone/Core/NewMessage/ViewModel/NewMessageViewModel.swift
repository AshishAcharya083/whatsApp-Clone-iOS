//
//  NewMessageViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/26/24.
//

import Foundation
import Firebase

class NewMessageViewModel : ObservableObject{
    
    @Published var users = [User]()
    
    init() {
        Task{
            try await self.fetchContacts()
        }
    }
    
    private func fetchContacts() async throws{
        print("fetch contacts called")
        let users = try await  UserService.shared.fetchAllUser()
       guard let currentUserId =  Auth.auth().currentUser?.uid else {return}
        print("all users length is \(users.count)")
        self.users = users.filter({$0.id != currentUserId})
        print("users are \(self.users)")
    }
 }
