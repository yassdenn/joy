//
//  ContentView.swift
//  Joy
//
//  Created by Dennis Knierim on 16.01.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: User
    @State var username: String = ""
    @State var password: String = ""
    @State var isLinkActive: Bool = false
    @State var authFailed: Bool = false

    var body: some View {
        NavigationView{
            background_image()
            .blur(radius: 10.0)
                .overlay(
                    VStack(alignment: .center){
                        logo_circle()
                            .offset(y: -60)
                        Spacer()
                            .frame(height: 50.0)
                        
                        VStack{
                            HStack{
                                Text("Username or email")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.white)
                                Spacer()
                                
                            }
                            
                            TextField(
                                "Username",
                                text: $username)
                                .padding(.all)
                                .background(Color(.white))
                                .cornerRadius(10)
                            HStack{
                                Text("Password")
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 4.0)
                                Spacer()
                                
                            }
                            SecureField(
                            "Password",
                            text: $password)
                                .padding(.all)
                                .background(Color(.white))
                                .cornerRadius(10)
                            if authFailed {
                                Text("Login detail incorrect. Please try again.")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.red)
                            }
                            
                            NavigationLink( destination: get_started() , isActive: $isLinkActive){
                                Button(action: {
                                    if username == modelData.username && password == modelData.password {
                                        self.isLinkActive = true
                                     }else {
                                        authFailed = true
                                    }
                                    
                                    print("Login tapped")
                                }){
                                    Text("LOGIN")
                                        .fontWeight(.regular)
                                        .font(.body)
                                        .padding()
                                        .frame(minWidth: 0,  maxWidth: .infinity)
                                        .background(Color("Color2"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                }
                                .padding(.top)
                            }
                          
                            HStack{
                                Button(action: {
                                    print("Forgot password tapped")
                                }){
                                    Text("Forgot password")
                                        .font(.footnote)
                                        .foregroundColor(Color.white)
                                }
                                Spacer()
                                Button(action: {
                                    print("Create account tapped")
                                }){
                                    Text("Create account")
                                        .font(.footnote)
                                        .foregroundColor(Color.white)
                                }
                            }
                            .padding(.all)
                            
                        }
                        .padding(.horizontal, 7.0)
                        .offset(y: -60)
                        
                        
                        
            })
        }
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
            
    }
}
