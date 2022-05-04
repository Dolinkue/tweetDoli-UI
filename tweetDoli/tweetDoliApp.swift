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
    
    @StateObject var viewModel = AuthViewModel()
    
    // inicio de Firebase en swiftUI
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    
                
            }
            .environmentObject(viewModel)
        }
    }
}
