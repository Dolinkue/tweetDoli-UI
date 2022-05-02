//
//  SideMenuRowView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 01/05/2022.
//

import SwiftUI

struct SideMenuRowView: View {
    
    let viewModel: SideMenuViewmodel
    
    var body: some View {
        HStack (spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.description)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
