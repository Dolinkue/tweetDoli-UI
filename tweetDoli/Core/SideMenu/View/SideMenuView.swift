//
//  SideMenuView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 01/05/2022.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        
        
        VStack (alignment: .leading){
            VStack (alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                VStack (alignment: .leading, spacing: 4){
                    Text("Nicolas Dolinkue")
                        .font(.headline)
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewmodel.allCases, id: \.rawValue){ viewModel in
                
                if viewModel == .profile {
                    NavigationLink {
                        ProfilleView()
                    } label: {
                        SideMenuOptionRowView(viewModel2: viewModel)
                    }

                } else if viewModel == .logout { 
                    
                } else {
                    SideMenuOptionRowView (viewModel2: viewModel )
                }

           }
            

            
            Spacer()
        }
        
        
    }
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


