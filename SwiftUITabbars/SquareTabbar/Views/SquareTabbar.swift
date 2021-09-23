//
//  SquareTabbar.swift
//  SquareTabbar
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct SquareTabbar: View {
    
    @State var index: Int = 0
    
    var body: some View {
        
        VStack {
            
            ZStack {
                if self.index == 0 {
                    Color.orange.opacity(0.45).edgesIgnoringSafeArea(.top)
                } else if self.index == 1 {
                    Color.green.edgesIgnoringSafeArea(.top)
                } else if self.index == 2 {
                    Color.yellow.edgesIgnoringSafeArea(.top)
                } else {
                    Color.purple.edgesIgnoringSafeArea(.top)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .padding(.bottom, -35)
            SquareTabs(index: self.$index)
        }
    }
}

struct SquareTabbar_Previews: PreviewProvider {
    static var previews: some View {
        SquareTabbar()
    }
}
