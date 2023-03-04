//
//  ProfileView.swift
//  Hackathon
//
//  Created by Ethan Chow on 3/4/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center){
                
                Image("DefaultProfilePic").resizable().frame(width: geo.size.width * 0.5, height: geo.size.width * 0.5).clipShape(Circle()).shadow(color: Color.cyan, radius: 10).padding()
                Text("Freetail Hackers").font(.system(size: 20))
                Divider()
                EcoScore()
                
                
                Divider()
                Text("Account").font(.system(size: 30)).foregroundColor(Color.gray).padding([.bottom, .trailing], 10)
                Divider()
                Text("Settings").font(.system(size: 30)).foregroundColor(Color.gray).padding([.bottom, .trailing], 10)
                Divider()
                Text("Contact Us").font(.system(size: 30)).foregroundColor(Color.gray).padding([.bottom, .trailing], 10)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
