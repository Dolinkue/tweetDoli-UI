//
//  UserService.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 07/05/2022.
//

//este servicio es para mechear la info de fire base con la del usuario

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    
    // con esta funcion traemos la info de firebase de cada usuario
    func fetchUser(withUid uid: String, completion: @escaping(User1) -> Void) {
        Firestore.firestore().collection("Users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user2 = try? snapshot.data(as: User1.self) else {return}
                completion(user2)
                
            }
    }
    
    // func para traer toda la data de los user y crear una array y cargarla en el explorer
    func fetchUsers(completion: @escaping([User1]) -> Void) {
        
        var users = [User1]()
        
        Firestore.firestore().collection("Users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                // se puede mejorar con compacMap ver despues como funcina
                documents.forEach { document in
                    guard let user2 = try? document.data(as: User1.self) else {return}
                    users.append(user2)
                }
                
                completion(users)
            }
    }
    
}
