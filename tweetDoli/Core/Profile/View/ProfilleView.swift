//
//  ProfilleView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 29/04/2022.
//

import SwiftUI
import Kingfisher

struct ProfilleView: View {
    // track selected filter
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    //@ObservedObject var viewModel = FeedViewModel()
    @ObservedObject var viewModel: ProfileViewModel
    
    
    // otra forma de traer la imagen del user si iniciar viewModel
    
  //  private let user: User1
    
    init(user: User1) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    
    
    
    var body: some View {
        VStack (alignment: .leading){
           
            headerView
        
            actionbuttons
            
            userInfoDetails
            
            tweetFilterBar
            
            
            tweetsView
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}

struct ProfilleView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilleView(user: User1(id: NSUUID().uuidString, userName: "nicodolinkue", fullName: "Nico dolinkue", profileImageUrl: "", email: "nico@me.com"))
    }
}

extension ProfilleView {
    
    var headerView: some View {
        
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }

                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
        
    }
    
    var actionbuttons: some View {
        
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.user.fullName)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.userName)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("alto gato")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("carmen de areco")
                    
                }
                
                
                
                HStack{
                    Image(systemName: "link")
                    Text("github/Dolinkue")
                    
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
            
                .padding(.vertical)
            
            
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        
        HStack {
            
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame( height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame( height: 3)
                        
                    }
                }
                
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectionFilter = item
                    }
                }
                
            }
            
        }
        
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach (viewModel.tweets(forFilter: self.selectionFilter)) { tweet in
                    
                    TweetsRowView(tweet: tweet)
                        .padding()
                    
                }
            }
            
        }
        
    }
    
    
}
