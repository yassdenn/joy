//
//  get_started.swift
//  Joy
//
//  Created by Dennis Knierim on 07.01.22.
//

import SwiftUI

struct get_started: View {
    
    @State var isLinkActive: Bool = false
    
    var body: some View {
        background_image()
        .blur(radius: 10.0)
            .overlay(
                VStack(alignment: .center){
                    Text("Welcome to JOY! \r\nYour personal digital \r\ntherapist")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .frame(maxWidth: 350, maxHeight: 110)
                        .background(Blur())
                        .cornerRadius(10)
                        .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(height: 40.0)
                    logo_circle()
                    Spacer()
                        .frame(height: 40.0)
                    NavigationLink(destination: daily_checkin_emotion(), isActive: $isLinkActive){
                        Button(action: {
                            print("Hello world tapped")
                            self.isLinkActive = true
                        }){
                            Text("GET STARTED")
                                .fontWeight(.regular)
                                .font(.body)
                                .padding()
                                .frame(minWidth: 0,  maxWidth: 150)
                                .background(Color("Color2"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    } 
            }
                    .offset(y: -60)
        )
    }
}

struct get_started_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                    get_started()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
        }
    }
}
