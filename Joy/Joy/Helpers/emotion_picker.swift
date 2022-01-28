//
//  emotion_picker.swift
//  Joy
//
//  Created by Dennis Knierim on 13.01.22.
//

import SwiftUI

struct emotion_picker: View {
    @EnvironmentObject var modelData: User
    @State var emotion: String = ""
    var body: some View {
        
        let emotions = [
        "angry",
        "bored",
        "happy",
        "in pain",
        "mute",
        "neutral",
        "sad",
        "shocked",
        "thrilled"]
        let columns = [
            GridItem(.adaptive(minimum: 70))]
        
        LazyVGrid(columns: columns, spacing: 5){
            ForEach(emotions, id: \.self){
                emotion_pick in
                ZStack{
                    VStack{
                        Image(emotion_pick)
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 73, height: 73)
                            .onTapGesture {
                                emotion = emotion_pick
                                modelData.emotions = emotion
                            }
                            .padding(10)
                        Text("\(emotion_pick)")
                            .offset(y: -15)
                    }
                    
                    
                    if emotion == emotion_pick {
                        Image(emotion_pick)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(Circle().stroke(Color("Color3"), lineWidth: 5))
                            .frame(width: 73, height: 73)
                            .offset(y: -15)
                    }
                }
            }
        }
        .frame(width: 260.0, height: 380.0)
        .background(Blur(style: .systemThinMaterialLight))
        .cornerRadius(10)
    }
}

struct emotion_picker_Previews: PreviewProvider {
    static var previews: some View {
        emotion_picker()
            .environmentObject(User())
    }
}
