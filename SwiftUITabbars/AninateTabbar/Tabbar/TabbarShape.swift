//
//  TabbarShape.swift
//  SwiftUI-AnimateTabbar
//
//  Created by Jovins on 2021/7/25.
//

import SwiftUI

struct TabbarShape: Shape {
    
    var xOffSet: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        
        let center = xOffSet - 3
        path.move(to: CGPoint(x: center - 50, y: 0))
        let value1: CGFloat = 25
        let value2: CGFloat = 35
        
        let pathOne1 = CGPoint(x: center - value1, y: 0.0)
        let pathOne2 = CGPoint(x: center - value1, y: value2)
        path.addCurve(to: CGPoint(x: center, y: value2), controlPoint1: pathOne1, controlPoint2: pathOne2)
        
        let pathTwo1 = CGPoint(x: center + value1, y: value2)
        let pathTwo2 = CGPoint(x: center + value1, y: 0)
        path.addCurve(to: CGPoint(x: center + 50, y: 0), controlPoint1: pathTwo1, controlPoint2: pathTwo2)
        
        return Path(path.cgPath)
    }
}
