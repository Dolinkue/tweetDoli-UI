//
//  ExploreView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 29/04/2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    
    var body: some View {
        VStack{
            
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView{
                LazyVStack {
                    ForEach(viewModel.searchbleUser) { user in
                        NavigationLink {
                                ProfilleView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }

                        
                    }
                }
            }
        }
        
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        

    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
