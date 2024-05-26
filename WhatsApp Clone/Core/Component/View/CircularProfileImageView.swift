//
//  CircularProfileImageView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/28/24.
//

import SwiftUI
import Kingfisher


enum ProfileImageSize{
    case xxsmall
    case xsmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge
    
    
    /// computed property to get the sizes
    var dimension : CGFloat  {
        switch self {
        case .xxsmall:
            return 28
        case .xsmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xlarge:
            return 80
        case .xxlarge:
            return 120
        }
    }
}

struct CircularProfileImageView: View {
    private var user : User?
    private var imageSize: ProfileImageSize
    init(imageSize: ProfileImageSize , user: User?) {
        self.imageSize = imageSize
        self.user = user
    }
    var body: some View {
        if let profileImageUrl = user?.profileImageUrl{
            KFImage(URL(string:profileImageUrl))
                .resizable()
                .clipShape(Circle())
                .frame(maxWidth: imageSize.dimension, maxHeight: imageSize.dimension)
                .scaledToFill()
        }else{
            Image(systemName: "person.circle")
                .resizable()
                .frame(maxWidth: imageSize.dimension, maxHeight: imageSize.dimension)
        }
      
            
    }
}

#Preview {
    CircularProfileImageView(imageSize: ProfileImageSize.medium , user: User.MOCK_USER)
}

