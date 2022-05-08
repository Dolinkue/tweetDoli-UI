//
//  UserRowView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 30/04/2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User1
    var body: some View {
        HStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: 56, height: 56)
                
            VStack (alignment: .leading, spacing: 4){
                Text(user.userName)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text(user.fullName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
        
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
