//
//  tweetDoliApp.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 29/04/2022.
//

import SwiftUI
import Firebase

@main
struct tweetDoliApp: App {
    
    // inicio de Firebase en swiftUI
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
//                ContentView()
                LoginView()
            }
        }
    }
}
