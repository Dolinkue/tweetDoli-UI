//
//  FeedViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 09/05/2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let userService = UserService()
    
    let service = TweetService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        // aca se hace la union entre la info del usuario y los tweets
        service.fetchTweets { tweets in
            self.tweets = tweets
            
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
            

            
        }
        
    }
    
}
