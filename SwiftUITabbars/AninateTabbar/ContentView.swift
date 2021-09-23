//
//  ContentView.swift
//  AninateTabbar
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTabbar = "home"
    @State var xOffSet: CGFloat = 0
    let tabbars: [String] = ["home", "heart", "dumbbell", "camera"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTabbar) {
               
                if self.selectedTabbar == self.tabbars[0] {
                    Color.blue.ignoresSafeArea()
                } else if self.selectedTabbar == self.tabbars[1] {
                    Color.red.ignoresSafeArea()
                } else if self.selectedTabbar == self.tabbars[2] {
                    Color.orange.ignoresSafeArea()
                } else {
                    Color.green.ignoresSafeArea()
                }
            }
            HStack() {
                ForEach(self.tabbars, id: \.self) { image in
                    
                    GeometryReader { reader in
                        TabbarButton(image: image, selectedTabbar: self.selectedTabbar, reader: reader) {
                            
                            withAnimation(Animation.linear(duration: 0.25)) {
                                self.selectedTabbar = image
                                self.xOffSet = reader.frame(in: .global).minX
                            }
                        }
                        .onAppear() {
                            if image == self.tabbars.first {
                                xOffSet = reader.frame(in: .global).minX
                            }
                        }
                    }
                    .frame(width: 30, height: 30)
                    if image != self.tabbars.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical)
            .background(Color.white.clipShape(TabbarShape(xOffSet: self.xOffSet)).cornerRadius(8))
            .padding(.horizontal)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
