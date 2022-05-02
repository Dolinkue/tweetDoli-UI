//
//  UserStatsView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 01/05/2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        
        HStack(spacing: 24){
            
            HStack(spacing: 4) {
                Text("200")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
            
            
            HStack(spacing: 4) {
                Text("1M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)

            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
