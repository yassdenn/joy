//
//  class_test.swift
//  Joy
//
//  Created by Dennis Knierim on 16.01.22.
//

import SwiftUI

struct class_test: View {
    @EnvironmentObject var userData: User
    var body: some View {
        Text(userData.emotions)
    }
}

struct class_test_Previews: PreviewProvider {
    static var previews: some View {
        class_test()
            .environmentObject(User())
    }
}
