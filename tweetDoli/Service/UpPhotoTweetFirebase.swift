//
//  UpPhotoTweetFirebase.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 12/05/2022.
import Firebase
import UIKit
import FirebaseStorage





struct UpPhotoTweetFirebase {
    
   // var imageTweet: String
    
    static func uploadImage (image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.2) else {return}
        
        let metaDataconfig = StorageMetadata()
        metaDataconfig.contentType = "image/jpg"
        
        let filename = NSUUID().uuidString
        //nombre en fire storage donde se guarda
        let ref = Storage.storage().reference(withPath: "tweet_image/\(filename).jpg")
        
        
        
       
            
            DispatchQueue.global(qos: .background).async {
                
                ref.putData(imageData, metadata: metaDataconfig) { _, error in
                    
                    DispatchQueue.main.async {
                        
                        
                        
                        if let error = error {
                            print("image with error\(error.localizedDescription)")
                            return
                        }
                    
                    
                    
                    ref.downloadURL { imageUrl, _ in
                        guard let imageUrl = imageUrl?.absoluteString else {return}
                        completion(imageUrl)
                    }
                    
                }
                    

            }
            
          
            
            
        }
    }
    
}
