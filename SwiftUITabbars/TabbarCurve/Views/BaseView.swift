//
//  BaseView.swift
//  BaseView
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct BaseView: View {
    
    @State var currtentTab = "house.fill"
    @State var curveAxis: CGFloat = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Tab View
            TabView(selection: $currtentTab) {
                Text("Home")
                    .tag("house.fill")
                Text("Search")
                    .tag("magnifyingglass")
                Text("Account")
                    .tag("person.fill")
            }
            .clipShape(
                CustomTabCurve(curveAxis: curveAxis)
            )
            .padding(.bottom, -90)
            HStack(spacing: 0) {
                TabbarButtons()
            }
            .frame(height: 50)
            .padding(.horizontal, 35)
        }
        .background(Color("BlueColor"))
        .ignoresSafeArea(.container, edges: .top)
    }
    
    @ViewBuilder
    func TabbarButtons() -> some View {
        
        ForEach(["house.fill", "magnifyingglass", "message.fill", "person.fill"], id:\.self) { image in
           
            GeometryReader { proxy in
                
                Button {
                    withAnimation {
                        self.currtentTab = image
                        // update curveTab
                        self.curveAxis = proxy.frame(in: .global).midX
                    }
                } label: {
                    Image(systemName: image)
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 45, height: 45)
                        .background(
                            Circle()
                                .fill(Color("BlueColor"))
                        )
                        .offset(y: self.currtentTab == image ? -25 : 0)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .onAppear {
                    if curveAxis == 0 && image == "house.fill" {
                        curveAxis = proxy.frame(in: .global).midX
                    }
                }
            }
        }
        .frame(height: 40)
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
