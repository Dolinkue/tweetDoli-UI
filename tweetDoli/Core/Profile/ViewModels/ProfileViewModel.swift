//
//  ProfileViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 10/05/2022.
//

import Foundation


class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    private let service =  TweetService()
    let user: User1
    
    init(user: User1){
        self.user = user
        self.fetchUserTweets()
    }
    
    
    func fetchUserTweets() {
        
        //aca se busca el usuario que quiero ver
        service.fetchTweetsUser(forUid: user.id!) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
}
