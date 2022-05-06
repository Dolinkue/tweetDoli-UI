//
//  ImageUploader.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 06/05/2022.
//

import Firebase
import UIKit
import FirebaseStorage


struct ImageUploader {
    
    static func uploadImage (image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let metaDataconfig = StorageMetadata()
        metaDataconfig.contentType = "image/jpg"
        
        let filename = NSUUID().uuidString
        //nombre en fire storage donde se guarda
        let ref = Storage.storage().reference(withPath: "profile_image/\(filename).jpg")
        
        ref.putData(imageData, metadata: metaDataconfig) { _, error in
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


