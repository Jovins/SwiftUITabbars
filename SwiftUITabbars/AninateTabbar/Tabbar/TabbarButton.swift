//
//  TabbarButton.swift
//  SwiftUI-AnimateTabbar
//
//  Created by Jovins on 2021/7/25.
//

import SwiftUI

struct TabbarButton: View {
    
    var image: String
    var selectedTabbar: String
    var reader: GeometryProxy
    var xOffSet: CGFloat = 0
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
        
            Image(image)
                .resizable()
                .renderingMode(.template)
                .scaleEffect()
                .frame(width: 25, height: 25)
                .foregroundColor(selectedTabbar == image ? Color.red : Color.gray)
                .padding(selectedTabbar == image ? 15 : 0)
                .background(Color.white.opacity(self.selectedTabbar == image ? 1 : 0).clipShape(Circle()))
                .offset(x: self.selectedTabbar == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0, y: self.selectedTabbar == image ? -50 : 0)
        }
    }
}

#if DEBUG
struct TabbarButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { reader in
            TabbarButton(image: "home", selectedTabbar: "home", reader: reader) {
                
            }
        }
        .frame(width: 30, height: 30)
    }
}
#endif
