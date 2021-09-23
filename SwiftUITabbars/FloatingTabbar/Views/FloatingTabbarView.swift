//
//  FloatingTabbarView.swift
//  FloatingTabbarView
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct FloatingTabbarView: View {
    
    @State var selected: Int = 0
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                if self.selected == 0 {
                   
                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            VStack(spacing: 16) {
                                ForEach(1...8, id: \.self) { i in
                                    Image("p\(i)")
                                        .resizable()
                                        .frame(height: 240)
                                        .cornerRadius(16)
                                }
                            }
                            .padding()
                            .navigationBarTitle("Home", displayMode: .inline)
                        }
                    }
                } else if self.selected == 1 {
                    Color.purple
                } else {
                    Color.orange
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            FloatingTabbar(selected: self.$selected)
        }
    }
}

struct FloatingTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTabbarView()
    }
}

