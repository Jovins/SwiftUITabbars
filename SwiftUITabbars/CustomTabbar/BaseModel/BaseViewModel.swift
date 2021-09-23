//
//  BaseViewModel.swift
//  BaseViewModel
//
//  Created by Jovins on 2021/9/24.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    // tab...
    @Published var currentTab: Tab = .Home
    @Published var homeTab = "Sneakers"
}

enum Tab: String {
    
    case Home = "home"
    case Heart = "heart"
    case ClipBoard = "clipboard"
    case Person = "person"
}
