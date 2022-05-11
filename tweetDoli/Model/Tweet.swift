//
//  Tweet.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 09/05/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    
    var user: User1?
    var didLike: Bool? = false
    
    
    
}
