//
//  ImageUploader.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/25/24.
//

import Foundation
import Firebase
import FirebaseStorage


struct ImageUploader{
    
    static func uploadProfileImage(uiImage: UIImage)async throws -> String? {
        
        guard let imageData = uiImage.jpegData(compressionQuality: 0.8) else {return nil}
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(UUID().uuidString)")
        
        do{
            _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        }catch{
            print("failed to upload image \(error.localizedDescription)")
            return nil
        }
         
    }
    
}
