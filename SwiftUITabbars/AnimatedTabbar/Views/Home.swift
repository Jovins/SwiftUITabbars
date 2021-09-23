//
//  Home.swift
//  Home
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab: String = "house"
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("TabBG")
                .ignoresSafeArea()
            // Custom Tabbar
            CustomTabbar(selectedTab: $selectedTab)
        }
    }
}

struct Home_Previews: PreviewProvider { 
    static var previews: some View {
        Home()
    }
}
