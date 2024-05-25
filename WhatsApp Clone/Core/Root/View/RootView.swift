//
//  RootView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/23/24.
//

import SwiftUI

struct RootView: View {
    
    
    @StateObject private var viewModel = RootViewModel()
    
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                InboxView()
            }else{
                WelcomeView()
            }
        }
    }
}

#Preview {
    RootView()
}
