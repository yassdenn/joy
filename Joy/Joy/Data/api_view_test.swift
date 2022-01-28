//
//  api_view_test.swift
//  Joy
//
//  Created by Dennis Knierim on 14.01.22.
//

import SwiftUI

struct api_view_test: View {
    @EnvironmentObject var userData: User
    var body: some View {
        VStack{
            Text(userData.username)
                
            Text(userData.emotions)
        }
        .background(Image("background")
                        .blur(radius: 10))
        
    }
}

struct api_view_test_Previews: PreviewProvider {
    static var previews: some View {
        api_view_test()
            .environmentObject(User())
    }
}
