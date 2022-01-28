//
//  homescreen_menu.swift
//  Joy
//
//  Created by Dennis Knierim on 13.01.22.
//

import SwiftUI

struct homescreen_menu: View {
    @State var userLink: Bool = false
    @State var homeLink: Bool = false
    @State var joyLink: Bool = false
    var body: some View {
        ZStack{
            VStack{
                
                HStack(spacing: 80.0){
                    NavigationLink(destination: user_page(), isActive: $userLink){
                        Button(action: {
                            self.userLink = true
                            print("profile tapped")
                        }){
                            Image(systemName: "person.fill")
                                .resizable(resizingMode: .tile)
                                .foregroundColor(Color(.white))
                                .frame(width: 40, height: 40)
                        }
                    }
                    NavigationLink(destination: daily_checkin_emotion(), isActive: $joyLink){
                        Button(action:{
                            print("joy tapped")
                            joyLink = true
                        }){
                            Image("logo")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                    }
                    NavigationLink(destination: joy_homescreen(), isActive: $homeLink){
                        Button(action: {
                            print("home tapped")
                            self.homeLink = true
                        }){
                            Image(systemName: "house.fill")
                                .resizable(resizingMode: .tile)
                                .foregroundColor(Color(.white))
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    
                }
                .frame(width: 354.0, height: 100.0)
            }
                .frame(width: 354, height: 100)
                .background(Blur(style: .systemUltraThinMaterial))
                .cornerRadius(20)

        }
    }
}

struct homescreen_menu_Previews: PreviewProvider {
    static var previews: some View {
        homescreen_menu()
    }
}
