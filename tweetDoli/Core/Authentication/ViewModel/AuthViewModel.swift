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
    @Published var currentUser: User1?
    // se crea un id temporal del user porque el otro se corta hasta que ingresas a la aplicacion y no sirve en este paso
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
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
            self.tempUserSession = user
            
            
       //   self.userSession = user
            
            
            let data = ["email": email,
                        "userName": usernName.lowercased(),
                        "fullName": fullName,
                        "uid": user.uid]
            
            
            Firestore.firestore().collection("Users")
                .document(user.uid)
                .setData(data) { _ in
            
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
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else {return}
        
        
        // actulizamos ls info de firebase con la foto y la incluimos en la info del usuario
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("Users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
        
        
    }
    
    func fetchUser() {
        
        guard let uid = self.userSession?.uid else {return}
        
        // con esta funcion traemos la info de firebase y la pasamos por user
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
    
}
