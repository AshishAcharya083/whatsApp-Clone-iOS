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
    
    /**
     Stored property with observer:
     This code defines a stored property called selectedImage of type PhotosPickerItem?. It also includes a didSet observer block that executes code whenever the selectedImage value changes.
     */
    
    @Published var selectedImage: PhotosPickerItem?{
        didSet{
            Task{
                try await loadImage(withItem: selectedImage)
            }
        }
    }
    
    private func loadImage(withItem item: PhotosPickerItem?) async throws{
        
    }
    
}
