//
//  TweetsRowView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 29/04/2022.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
    let tweet: Tweet
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            if let user = tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        
                    
                    // user info &tweet caption
                    VStack (alignment: .leading, spacing: 4){
                        HStack {
                            Text(user.fullName)
                                .font(.subheadline).bold()
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("2W")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
                     
                        
                        // tweet caption
                        
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
        
            // action Buttons
            HStack {
                Button {
                    //action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }


                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        
        }

        
    }
}

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}
