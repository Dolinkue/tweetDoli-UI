//
//  TweetService.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 09/05/2022.
//
import SwiftUI
import Firebase
import Darwin
import FirebaseAuth


struct TweetService {
    
    func uploadTweet(caption: String, tweetImage: String, completion: @escaping(Bool) -> Void) {
        // uid lo vamos a usar para traer la info del que escribio el tweet
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "caption": caption,
                    "tweetImage": tweetImage,
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
        
        Firestore.firestore().collection("Tweets")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let tweets = documents.compactMap ({ try? $0.data(as: Tweet.self) })
                  completion(tweets)
            
                
            
        }
    }
    
    
    func fetchTweetsUser(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        
        
        Firestore.firestore().collection("Tweets")
        // aca busca los twees que solo tengan el mismo uid
            .whereField("uid", isEqualTo: uid)
            .addSnapshotListener { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let tweets = documents.compactMap ({ try? $0.data(as: Tweet.self) })
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            
                
            
        }
        
        
        
        
    }
    

    
    
}

// MARK: - LIKES


extension TweetService {
    func likeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        // dentro del doc user crea otro doc user-like
        let userLikesRef = Firestore.firestore().collection("Users")
            .document(uid).collection("user-likes")
        
        Firestore.firestore().collection("Tweets").document(tweetId)
            .updateData(["likes": tweet.likes + 1]) { _ in
                userLikesRef.document(tweetId).setData([:]) { _ in
                    completion()
                }
            }
        
        
    }
    
    
    func unlikeTweet (_ tweet: Tweet, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        guard tweet.likes > 0 else {return}
        let userLikesRef = Firestore.firestore().collection("Users")
            .document(uid).collection("user-likes")
        
        Firestore.firestore().collection("Tweets").document(tweetId)
            .updateData(["likes": tweet.likes - 1]) { _ in
                userLikesRef.document(tweetId).delete {_ in
                    completion()
                }
            }
        
        
    }
    
    
    func checkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        Firestore.firestore().collection("Users")
            .document(uid).collection("user-likes").document(tweetId).addSnapshotListener { snapshot, _ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
            }
        
    }
    
    
    func fetchLikedTweets (forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        
        var tweets = [Tweet]()
        
        Firestore.firestore().collection("Users").document(uid).collection("user-likes")
            .addSnapshotListener { snapshot, _ in
                // aca traemos todos los likes que hizo el usuario como documentos vacios
                guard let documets = snapshot?.documents else {return}
                
                documets.forEach { doc in
                    let tweetID = doc.documentID
                    
                    Firestore.firestore().collection("Tweets").document(tweetID)
                        .addSnapshotListener { snapshot, _ in
                            
                            
                            guard let tweet = try? snapshot?.data(as: Tweet.self) else {return}
                            tweets.append(tweet)
                            
                            completion(tweets)
                        }
                }
            }
    }
    
}
