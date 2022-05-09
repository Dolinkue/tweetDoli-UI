//
//  TweetService.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 09/05/2022.
//

import Firebase
import Darwin


struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        // uid lo vamos a usar para traer la info del que escribio el tweet
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date()) ] as [String : Any]
        
        //subimos la info a firebase
        Firestore.firestore().collection("Tweets")
            .document().setData(data) { error in
                if let error = error {
                    print("Error es \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
        
        
        
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        
        Firestore.firestore().collection("Tweets").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            let tweets = documents.compactMap ({ try? $0.data(as: Tweet.self) })
              completion(tweets)
            
                
            
        }
    }
    
}
