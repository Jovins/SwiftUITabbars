//
//  TabbarView.swift
//  SwiftUI-Tabbar
//
//  Created by Jovins on 2021/7/26.
//

import SwiftUI

struct TabbarView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(hex: 0xefefef).withAlphaComponent(0.25)
    }
    
    var body: some View {
        
        VStack {
            TabView {
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }
                .tag(1)
                MapView().tabItem {
                    Image(systemName: "map.fill")
                    Text("地图")
                }
                .tag(2)
                ProfileView().tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("我的")
                }
                .tag(3)
            }
            .accentColor(.blue)
        }
    }
}


extension UIColor {
    
    /// Init color with hex code
    /// - Parameter value: hex code (eg. 0x003300)
    /// - Returns: UIColor
    convenience init(hex: UInt32) {
        self.init(
            CGFloat((hex & 0xFF0000) >> 16),    // red
            CGFloat((hex & 0xFF00) >> 8),       // green
            CGFloat((hex & 0xFF))               // blue
        )
    }
    
    convenience init(_ r256: CGFloat, _ g256: CGFloat, _ b256: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r256 / 255.0, green: g256 / 255.0, blue: b256 / 255.0, alpha: alpha)
    }
}
