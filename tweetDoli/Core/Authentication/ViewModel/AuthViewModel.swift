//
//  AuthViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 04/05/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    // esta var es para poder sacar la foto de usuario
    @Published var didAuthUser = false
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func Login(withEmail email: String, password: String)  {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("error signin\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            
            
        }
        
            
    }
    
    func register(withEmail email: String, password: String, fullName: String, usernName: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error register\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            // sacar si no corrijo el error
            
       //   self.userSession = user
            
            
            let data = ["email": email,
                        "userName": usernName.lowercased(),
                        "fullName": fullName,
                        "uid": user.uid]
            
            
            Firestore.firestore().collection("Users")
                .document(user.uid)
                .setData(data) { _ in
                    // ver por que da error
                  self.didAuthUser = true
                }
            
        }
        
    }
    
    func sihgnOut() {
        
        // show login in the app
        userSession = nil
        // out on backend/server
        try? Auth.auth().signOut()
    }
    
}
