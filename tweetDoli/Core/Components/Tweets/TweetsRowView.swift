//
//  TweetsRowView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 29/04/2022.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    
    init (tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            if let user = viewModel.tweet.user {
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
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        
                        KFImage(URL(string: viewModel.tweet.tweetImage ?? ""))
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                            
                            
                        
                        
                    }
                }
            }
        
            // action Buttons
            HStack {
//                Button {
//                    //action
//                } label: {
//                    Image(systemName: "bubble.left")
//                        .font(.subheadline)
//                }
//
//                Spacer()
//
//                Button {
//                    //action
//                } label: {
//                    Image(systemName: "arrow.2.squarepath")
//                        .font(.subheadline)
//                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() :viewModel.likeTweet()
                } label: {
                    if viewModel.tweet.didLike == true {
                           Image ( systemName: "heart.fill" )

                            }else {
                                Image (systemName: "heart")
                            }
                        
                    }
                    
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                
                
                Spacer()
                
//                Button {
//                    //action
//                } label: {
//                    Image(systemName: "bookmark")
//                        .font(.subheadline)
//                }


                
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
