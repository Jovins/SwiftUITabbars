//
//  ProfileView.swift
//  SwiftUI-Tabbar
//
//  Created by Jovins on 2021/7/26.
//

import SwiftUI

class Profile {
    
    var name: String = ""
    var subtitle: String = ""
    var companyName: String = ""
    var description: String = ""
    var profilePic: String = ""
    
    init(name: String, subtitle: String, companyName: String, description: String, profilePic: String) {
        self.name = name
        self.subtitle = subtitle
        self.companyName = companyName
        self.description = description
        self.profilePic = profilePic
    }
}

struct ProfileView: View {
    
    let imageWidth: CGFloat = UIScreen.main.bounds.width * 0.5
    var profile: Profile = Profile(name: "Jovins Wong", subtitle: "Senior iOS Developer", companyName: "Turning ins.", description: "SwiftUI - Better Apps. Less Code", profilePic: "profilepic")
    
    var profileButton: some View {
        Button(action: {  }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            
            VStack {
                Group {
                Image(profile.profilePic)
                    .resizable()
                    .frame(width:imageWidth, height: imageWidth, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .shadow(color: .blue, radius: 20, x: 1.0, y: 0.0)
                Text(profile.name)
                    .font(.title)
                    .foregroundColor(Color.pink)
                Text(profile.companyName).font(.title)
                Text(profile.subtitle)
                    .font(.headline)
                Text(profile.description)
                    .font(.body)
                Divider()
                }
            }.padding()
        }
    }
}
