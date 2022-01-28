//
//  edit_user.swift
//  Joy
//
//  Created by Dennis Knierim on 16.01.22.
//

import SwiftUI

struct edit_user: View {
    @EnvironmentObject var modelData: User
    @State var toggle = true
    @State var username = ""
    @State var notifLink = false
    var body: some View {
            VStack{
                HStack{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 38, height: 40)
                    VStack{
                        TextField(
                            modelData.username,
                            text: $username)
                            .padding(/*@START_MENU_TOKEN@*/.all, 7.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 173, height: 36)
                            .background(Color(.white))
                            .cornerRadius(10)
                            .ignoresSafeArea(.keyboard)
                            .onSubmit{
                                modelData.username = username
                            }
                    }
                    .frame(width: 173, height: 91)
                }
                .frame(width: 328, height: 150)
                .background(Color("black_back"))
                .cornerRadius(10)
                VStack{
                    NavigationLink(destination: notifyMe(), isActive: $notifLink){
                        Button(action:{
                            print("notif tapped")
                            notifLink = true
                        }){
                            Text("NOTIFICATIONS")
                                .foregroundColor(Color.black)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                .frame(width: 254, height: 36, alignment: .leading)
                                .font(.footnote)
                                .background(Color("Color4"))
                                .cornerRadius(10)
                        }
                    }
                    
                    
                        
                    Spacer()
                        .frame(height: 20)
                    Text("INVITE A FRIEND")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 254, height: 36, alignment: .leading)
                        .font(.footnote)
                        .background(Color("Color4"))
                        .cornerRadius(10)
                    Spacer()
                        .frame(height: 20)
                    Text("FEEDBACK")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 254, height: 36, alignment: .leading)
                        .font(.footnote)
                        .background(Color("Color4"))
                        .cornerRadius(10)
                    Spacer()
                        .frame(height: 20)
                    Text("PRIVACY")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 254, height: 36, alignment: .leading)
                        .font(.footnote)
                        .background(Color("Color4"))
                        .cornerRadius(10)
                    Spacer()
                        .frame(height: 20)
                    Text("HELP")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 254, height: 36, alignment: .leading)
                        .font(.footnote)
                        .background(Color("Color4"))
                        .cornerRadius(10)

                    HStack{
                        Text("TERMS")
                        Spacer()
                        Text("CONTACT")
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .font(.footnote)
                    .frame(width: 254, height: 36)
                    
                }
                .ignoresSafeArea(.keyboard)
                .frame(width: 354, height: 397)
                .background(Color("black_back"))
                .cornerRadius(10)
                Spacer()
                    .frame(height: 50)
                homescreen_menu()
                    .ignoresSafeArea(.keyboard)
            }
                .offset(y:-35)
                .background(Image("background")
                                .blur(radius: 10))
                .ignoresSafeArea(.keyboard)
        
    }
}

struct edit_user_Previews: PreviewProvider {
    static var previews: some View {
        edit_user()
            .environmentObject(User())
    }
}
