//
//  JoyApp.swift
//  Joy
//
//  Created by Dennis Knierim on 06.01.22.
//

import SwiftUI

@main
struct JoyApp: App {
    @StateObject var modelData = User()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
