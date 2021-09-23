//
//  CustomTabCurve.swift
//  CustomTabCurve
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct CustomTabCurve: Shape {
    
    var curveAxis: CGFloat
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            // curve above 100
            let height = rect.height - 100
            // points
            let p1 = CGPoint(x: 0, y: 0)
            let p2 = CGPoint(x: rect.width, y: 0)
            let p3 = CGPoint(x: rect.width, y: height)
            let p4 = CGPoint(x: 0, y: height)
            
            path.move(to: p1)
            // bottom corner radius
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 0)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 0)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 20)
            path.addArc(tangent1End: p4, tangent2End: p1, radius: 20)
            
            let mid = curveAxis
            let curve = rect.height - 50
            path.move(to: CGPoint(x: mid - 60, y: height))
            
            // Curve
            let to1 = CGPoint(x: mid, y: curve)
            let control1 = CGPoint(x: mid - 30, y: height)
            let control2 = CGPoint(x: mid - 30, y: curve)
            path.addCurve(to: to1, control1: control1, control2: control2)
            
            // Joining Curve
            let to2 = CGPoint(x: mid + 58, y: height)
            let control3 = CGPoint(x: mid + 30, y: curve)
            let control4 = CGPoint(x: mid + 30, y: height)
            path.addCurve(to: to2, control1: control3, control2: control4)
            
        }
    }
}

struct CustomTabCurse_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

