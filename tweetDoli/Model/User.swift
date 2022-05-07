//
//  User.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 07/05/2022.
//

import FirebaseFirestoreSwift

// con fireSwift lo que se hace es importar el protocolo decorable para firebase

struct User1: Identifiable,Decodable {
    
    @DocumentID var id: String?
    let userName: String
    let fullName: String
    let profileImageUrl: String
    let email: String
    
    
}


