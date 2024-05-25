//
//  RootViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/23/24.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class RootViewModel : ObservableObject{
    
    
    @Published var userSession : FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    /**
     cancellable is used to cancel any ongoing tasks when the object is deinitialized.
     */
    
    init() {
        setupSubscribers()
    }
    
    
    
    private func setupSubscribers(){
        /*
         [`weak` `self`]: This weak reference to self prevents a strong reference cycle and potential memory leaks.
         */
        AuthService.shared.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellable)
        
        /*
         .store(in: &cancellable): This stores the cancellable created by the sink operation in the cancellable set for proper management.
         */
    }
    
}
