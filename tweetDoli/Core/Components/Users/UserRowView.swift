//
//  UserRowView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 30/04/2022.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 48, height: 48)
            VStack (alignment: .leading, spacing: 4){
                Text("moro")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text("perro mala leche")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
