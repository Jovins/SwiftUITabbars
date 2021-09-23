//
//  BaseView.swift
//  BaseView
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

struct BaseView: View {
    
    @StateObject var baseData = BaseViewModel()
    
    // hide tab
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       
        TabView(selection: self.$baseData.currentTab) {
            
            Home()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange.opacity(0.54))
                .tag(Tab.Home)
            Heart()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green.opacity(0.54))
                .tag(Tab.Heart)
            ClipBoard()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.purple.opacity(0.54))
                .tag(Tab.ClipBoard)
            Person()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.54))
                .tag(Tab.Person)
        }
        .overlay (
            // Custom Tabbar
            HStack(spacing: 0) {
                TabbarButton(Tab: .Home)
                TabbarButton(Tab: .Heart)
                    .offset(x: -10)
                
                // center curved
                Button {
                    print("center curved action")
                } label: {
                    Image("cart")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x: -1)
                        .padding(18)
                        .background(Color("DarkBlue"))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                }
                .offset(y: -30)
                
                TabbarButton(Tab: .ClipBoard)
                    .offset(x: 10)
                TabbarButton(Tab: .Person)
            }
                .background(
                    Color.white
                    .clipShape(CustomCurveShape())
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            // hide tabbar when detail opens
                .offset(y: 0)
            ,alignment: .bottom)
    }
    
    @ViewBuilder
    func TabbarButton(Tab: Tab) -> some View {
        
        Button {
            withAnimation {
                self.baseData.currentTab = Tab
            }
        } label: {
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25, alignment: .center)
                .foregroundColor(self.baseData.currentTab == Tab ? Color("DarkBlue") : Color.gray.opacity(0.8))
                .frame(maxWidth: .infinity)
        }

    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

