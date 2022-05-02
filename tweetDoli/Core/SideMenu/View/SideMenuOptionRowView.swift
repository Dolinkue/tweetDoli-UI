//
//  SideMenuOptionRowView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 02/05/2022.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    
    let viewModel2: SideMenuViewmodel
    
    var body: some View {
        HStack (spacing: 16){
            Image(systemName: viewModel2.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel2.description)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel2: .profile)
    }
}
