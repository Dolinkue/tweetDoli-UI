//
//  TweetFilterViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 30/04/2022.
//

import Foundation



enum TweetFilterViewModel: Int, CaseIterable {
    
    case tweets
    case replies
    case likes
    
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
    
}
