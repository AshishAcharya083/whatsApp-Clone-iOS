//
//  ProfileViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/18/24.
//

import Foundation


import SwiftUI
import PhotosUI


class ProfileViewModel : ObservableObject{
    @Published var tabbarVisibility: Visibility = .hidden
    @Published var showPhotoPicker: Bool = false
    @Published var profileImage: Image?
    
    /**
     Stored property with observer:
     This code defines a stored property called selectedImage of type PhotosPickerItem?. It also includes a `didSet` observer block that executes code whenever the selectedImage value changes.
     */
    @Published var selectedImage: PhotosPickerItem?{
        didSet{
            print("did Set called")
            Task{
                try await loadImage(withItem: selectedImage)
            }
        }
    }
    
    private func loadImage(withItem item: PhotosPickerItem?) async throws{
        guard let item = item else {return}
        guard let data = try await item.loadTransferable(type: Data.self) else {return}
        guard  let uiImage = UIImage(data: data) else {return}
        
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
}
