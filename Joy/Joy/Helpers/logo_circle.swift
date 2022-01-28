//
//  logo_circle.swift
//  Joy
//
//  Created by Dennis Knierim on 06.01.22.
//

import SwiftUI

struct logo_circle: View {
    var image = Image("logo")
    var body: some View {
        image
            .resizable()
            .frame(width: 150.0, height: 150.0)
            .clipShape(Circle())
                        
    }
}

struct logo_circle_Previews: PreviewProvider {
    static var previews: some View {
        logo_circle()
    }
}
