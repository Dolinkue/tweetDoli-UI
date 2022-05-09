//
//  UploadTweet.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 09/05/2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                // cerrar el screen
                self.didUploadTweet = true
                
            }else {
             // mostrar error
                
                
            }
        }
    }
    
    
}
