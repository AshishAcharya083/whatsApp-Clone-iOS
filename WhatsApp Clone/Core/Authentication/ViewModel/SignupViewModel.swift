//
//  SignupViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/22/24.
//

import Foundation
import SwiftUI

class SignupViewModel : ObservableObject{
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    
    func createUser()async throws {
        print("create user called");
        try await AuthService.shared.createUser(email: email, password: password, fullName: fullName, phoneNumber: phoneNumber)
    }
}
