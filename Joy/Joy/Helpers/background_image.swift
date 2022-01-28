//
//  background_image.swift
//  Joy
//
//  Created by Dennis Knierim on 09.01.22.
//

import SwiftUI

struct background_image: View {
    var body: some View {
        VStack{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        }
        .ignoresSafeArea(.keyboard)
        
    }
}

struct background_image_Previews: PreviewProvider {
    static var previews: some View {
        background_image()
    }
}
