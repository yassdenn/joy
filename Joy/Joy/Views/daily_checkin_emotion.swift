//
//  daily_checkin_emotion.swift
//  Joy
//
//  Created by Dennis Knierim on 13.01.22.
//

import SwiftUI

struct daily_checkin_emotion: View {
    @EnvironmentObject var modelData: User
    @State var isLinkActive: Bool = false
    var body: some View {
        background_image()
            .overlay(
                VStack(alignment: .center){
                   joy_clock()
                    .offset(x: 20)
                    VStack(alignment: .center){
                        Text("How do you feel today?")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.white))
                            .frame(width: 230, height: 2)
                            .offset(y: 10)
                        emotion_picker()
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: daily_checkin_journal(), isActive: $isLinkActive){
                            Button(action: {
                                print("Continue tapped")
                                self.isLinkActive = true
                                print(modelData.emotions)
                            }){
                                HStack{
                                    
                                    Text("continue")
                                        .fontWeight(.regular)
                                        .font(.body)
                                }
                                    .frame(maxWidth: 297, maxHeight: 48)
                                    .background(Color("Color2"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    .frame(maxWidth: 328, maxHeight: 570)
                    .background(Color("black_back"))
                    .cornerRadius(10)
                    
                }
                    .offset(y: -40)
            )
    }
}

struct daily_checkin_emotion_Previews: PreviewProvider {
    static var previews: some View {
        daily_checkin_emotion()
            .environmentObject(User())
    }
}
