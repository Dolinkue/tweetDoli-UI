//
//  TweetRowViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 10/05/2022.
//

import Foundation


class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    

    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet () {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikedTweet(tweet) { didlike in
            if didlike {
                self.tweet.didLike = true
            }
        }
    }
}
