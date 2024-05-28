//
//  InboxViewModel.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/28/24.


import Foundation
import Combine


class InboxViewModel : ObservableObject{
    
    @Published var showNewMessage: Bool = false
    @Published var currentUser: User?
    private var cancellable : Set<AnyCancellable> = Set<AnyCancellable>()
    @Published var showChat : Bool = false
    
    
    init() {
        setupSubscription()
    }
    
    private func setupSubscription(){
        UserService.shared.$currentUser.sink { [weak self]  currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellable)
    }
}
