//
//  UserService.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/24/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class UserService{
    
    @Published var currentUser: User?
   static var shared = UserService()
    
    init()  {
        Task{
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws{
        
        do{
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            
            let snapshort = try await Firestore.firestore().collection("users").document(uid).getDocument()
            currentUser = try snapshort.data(as: User.self)
            
        } catch{
            print("failed to fetch current user \(error.localizedDescription)")
        }
    }
    
}
