//
//  ProfileViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/18/24.
//

import Foundation


import SwiftUI
import PhotosUI
import FirebaseFirestore


class ProfileViewModel : ObservableObject{
    @Published var tabbarVisibility: Visibility = .hidden
    @Published var showPhotoPicker: Bool = false
    @Published var profileImage: Image?
    
    
    init() {
      
        print("profile view model initialized")
        guard let  imageUrl : String = UserService.shared.currentUser?.profileImageUrl else {return}
        var image : Image = Image(imageUrl)
        print("Profile view model, image url is \(imageUrl)")
        profileImage = image

    }
    
    /**
     Stored property with observer:
     This code defines a stored property called selectedImage of type PhotosPickerItem?. It also includes a `didSet` observer block that executes code whenever the selectedImage value changes.
     */
    @Published var selectedImage: PhotosPickerItem?{
        didSet{
 
            Task{
                try await loadImage(withItem: selectedImage)
            }
        }
    }
    
    private func loadImage(withItem item: PhotosPickerItem?) async throws{
        guard let item = item else {return}
        guard let data = try await item.loadTransferable(type:Data.self) else {return}
        guard  let uiImage = UIImage(data: data) else {return}
        self.profileImage = Image(uiImage: uiImage)
        try await updateProfileImage(uiImage: uiImage)
        
    }
    
    private func updateProfileImage(uiImage: UIImage)async throws {
        
        guard let imageUrl = try await  ImageUploader.uploadProfileImage(uiImage: uiImage) else {return}
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
}
