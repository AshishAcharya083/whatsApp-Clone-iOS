//
//  LoginViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/19/24.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject{
    @Published var email: String = ""
    @Published var passowrd : String = ""
    
    
    func loginUser()async throws{
       try await AuthService.shared.loginUser(userWithEmail: self.email, andPassword: self.passowrd)
    }
}
