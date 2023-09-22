//
//  tsl_wall_appApp.swift
//  tsl_wall_app
//
//  Created by Ruben Hales on 9/22/23.
//

import SwiftUI
import Firebase

@main
struct tsl_wall_appApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           ContentView() //changed to listview() to opne directly from ListView()
                .environmentObject(dataManager)
        }
    }
}
