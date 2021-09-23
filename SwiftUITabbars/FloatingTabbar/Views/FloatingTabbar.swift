//
//  FloatingTabbar.swift
//  FloatingTabbar
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct FloatingTabbar: View {
    
    @Binding var selected: Int
    @State var expand: Bool = false
    
    var body: some View {
        
        HStack {
            
            Spacer(minLength: 0)
            
            HStack {
                
                if !self.expand {
                    
                    Button(action: {
                        
                        self.expand.toggle()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                    }
                } else {
                    
                    Button(action: {
                        self.selected = 0
                    }) {
                        Image(systemName: "house").foregroundColor(self.selected == 0 ? .purple : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image(systemName: "heart").foregroundColor(self.selected == 1 ? .purple : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image(systemName: "cart").foregroundColor(self.selected == 2 ? .purple : .gray).padding(.horizontal)
                    }
                }
            }
            .padding(.vertical, self.expand ? 20 : 8)
            .padding(.horizontal, self.expand ? 35 : 8)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(22)
            .onLongPressGesture {
                self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}
