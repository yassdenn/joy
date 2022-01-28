//
//  user_page.swift
//  Joy
//
//  Created by Dennis Knierim on 16.01.22.
//

import SwiftUI

struct user_page: View {
    @EnvironmentObject var modelData: User
    @State var editLink : Bool = false
    @State var journalLink: Bool = false
    var body: some View {
        background_image()
            .overlay(
                VStack{
                    HStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 38, height: 41)
                            .padding(.horizontal, 20.0)
                        Spacer()
                            .frame(width: 10)
                        Text("Hey! \(modelData.username)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .font(.title)
                            .padding(.horizontal, 20.0)
                    }
                    .frame(width: 328, height: 153, alignment: .center
                    )
                    .background(Color("black_back"))
                    .cornerRadius(10)
                    .padding(.all)
                    VStack{
                        HStack{
                            NavigationLink(destination: edit_user(), isActive: $editLink){
                                Button(action: {
                                    print("edit tapped")
                                    editLink = true
                                }){
                                    VStack{
                                        Image(systemName: "pencil.circle.fill")
                                            .resizable(resizingMode: .tile)
                                            .foregroundColor(Color(.white))
                                            .frame(width: 40, height: 40)
                                    }
                                    .frame(width: 105, height: 105)
                                    .background(Blur())
                                    .cornerRadius(20)
                                    
                                    
                                }
                            }
                            
                            Spacer()
                                .frame(width: 50)
                            Button(action: {
                                print("liked tapped")
                            }){
                                VStack{
                                    Image(systemName: "heart.fill")
                                        .resizable(resizingMode: .tile)
                                        .foregroundColor(Color(.white))
                                        .frame(width: 35, height: 35)
                                    Text("Coming soon")
                                }
                                .frame(width: 105, height: 105)
                                .background(Blur())
                                .cornerRadius(20)
 
                            }
                        }
                        
                        Spacer()
                            .frame(height:40)
                        
                        HStack{
                            NavigationLink(destination: journal_page(), isActive: $journalLink){
                                Button(action: {
                                    print("journal tapped")
                                    journalLink = true
                                }){
                                    HStack{
                                        Image(systemName: "book.fill")
                                            .resizable(resizingMode: .tile)
                                            .foregroundColor(Color(.white))
                                            .frame(width: 50, height: 35)
                                    }
                                    .frame(width: 105, height: 105)
                                    .background(Blur())
                                    .cornerRadius(20)
                                    
                                    
                                }
                            }
                            
                            Spacer()
                                .frame(width: 50)
                            Button(action: {
                                print("home tapped")
                            }){
                                VStack{
                                    Image(systemName: "brain.head.profile")
                                        .resizable(resizingMode: .tile)
                                        .foregroundColor(Color(.white))
                                        .frame(width: 35, height: 40)
                                    Text("Coming soon")
                                }
                                .frame(width: 105, height: 105)
                                .background(Blur())
                                .cornerRadius(20)
                                
                                
                            }
                        }
                    }
                    .frame(width: 328, height: 357)
                    .background(Color("black_back"))
                    .cornerRadius(10)
                    Spacer()
                        .frame(height:50)
                    homescreen_menu()
                }
                    .offset(y:-40)
                
            )
    }
}

struct user_page_Previews: PreviewProvider {
    static var previews: some View {
        user_page()
            .environmentObject(User())
    }
}
