//
//  MainTabBarView.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 4/25/24.
//

import Foundation
import SwiftUI


struct MainTabBarView : View{
    
    @State private var selectedIndex : Int = 0
    
    var body: some View{

        TabView{
            Text("Inbox")
                .tabItem {
                    VStack{
                        Image(systemName: "bubble")
                        Text("Inbox")
                    }.environment(\.symbolVariants , selectedIndex == 0 ? .fill : .none )
                }.onAppear{
                    selectedIndex = 0
                }
            Text("Updates")
                .tabItem {
                    VStack{
                        Image(systemName: "dial.low")
                        Text("Updates")
                    }.environment(\.symbolVariants , selectedIndex == 1 ? .fill : .none )
                }.onAppear{
                    selectedIndex = 1
                }
            Text("Communities")
                .tabItem {
                    VStack{
                        Image(systemName: "person.3")
                        Text("Communities")
                    }.environment(\.symbolVariants , selectedIndex == 2 ? .fill : .none )
                }.onAppear{
                    selectedIndex = 2
                }
        }

           
        
    }
}

#Preview {
    MainTabBarView()
}
