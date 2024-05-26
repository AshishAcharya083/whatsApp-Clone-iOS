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
        print("FETCH CURRENT USER CALLED")
        do{
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            
            let snapshort = try await Firestore.firestore().collection("Users").document(uid).getDocument()
            currentUser = try snapshort.data(as: User.self)
//            let jsonData = snapshort.data();
//            let jsonDecoder = JSONDecoder()
//            let decodedUser = try jsonDecoder.decode(User.self, from: jsonData)
            print("HERE: ")
            print("THE NEW USER IS: \(String(describing: snapshort.data()))")
            
        } catch{
            print("failed to fetch current user \(error.localizedDescription)")
        }
    }
    
 
    @MainActor
    func fetchAllUser() async throws -> [User]{
        let snapshot = try await Firestore.firestore().collection("Users").getDocuments()
//        var users : [User] = []
//       try  snapshot.documents.forEach({
//            s in
//            let user = try s.data(as: User.self)
//            users.append(user)
//        })
        //        return users
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})

    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl : String ) async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        try await Firestore.firestore().collection("Users").document(uid).updateData(["profileImageUrl" : imageUrl])
        self.currentUser?.profileImageUrl = imageUrl
        
    }
}
