//
//  SquareTabs.swift
//  SquareTabs
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct SquareTabs: View {
    
    @Binding var index: Int
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                
                self.index = 0
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
            }
            .foregroundColor(self.index == 0 ? Color.blue : Color.black.opacity(0.25))
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }) {
                Image(systemName: "bolt.car.circle.fill")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
            }
            .foregroundColor(self.index == 1 ? Color.blue : Color.black.opacity(0.25))
            .offset(x: 10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }) {
                Image("tab_add_selected").renderingMode(.template)
            }
            .frame(width: 44, height: 44, alignment: .center)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(22)
            .offset(y: -24)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }) {
                Image(systemName: "message.fill")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
            }
            .foregroundColor(self.index == 2 ? Color.blue : Color.black.opacity(0.25))
            .offset(x: -10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
            }
            .foregroundColor(self.index == 3 ? Color.blue : Color.black.opacity(0.25))
        }
        .padding(.horizontal, 35)
        .padding(.top, 35)
        .background(Color.white)
        .clipShape(CShape())
    }
}

struct CShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
                
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            
            path.addArc(center: CGPoint(x: rect.width / 2 - 1, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}
