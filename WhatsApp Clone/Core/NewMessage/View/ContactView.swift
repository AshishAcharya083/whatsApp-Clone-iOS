//
//  ContactView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/28/24.
//

import Foundation
import SwiftUI


struct ContactView: View {
    private var imageName: String
    private var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    var body: some View {
        HStack(spacing:16){
            Image(systemName: imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color(Color.gray))
            Text(title)
            Spacer()
        }
    }
}
