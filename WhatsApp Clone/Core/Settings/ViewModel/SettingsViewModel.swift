//
//  SettingsViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import Foundation
import SwiftUI


class SettingsViewModel : ObservableObject{
    @Published var tabbarVisibility: Visibility = .hidden
    

    func logOut() throws{
    try AuthService.shared.signOut();
    }
}
