//
//  SideMenuView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 01/05/2022.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authviewModel: AuthViewModel
    
    var body: some View {
        
        
        if let user = authviewModel.currentUser {
            VStack (alignment: .leading){
                VStack (alignment: .leading){
                    Circle()
                        .frame(width: 48, height: 48)
                    VStack (alignment: .leading, spacing: 4){
                        Text(user.fullName)
                            .font(.headline)
                        Text("@\(user.userName)")
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
                        Button {
                            authviewModel.sihgnOut()
                        } label: {
                            SideMenuOptionRowView (viewModel2: viewModel)
                        }

                        
                    } else {
                        SideMenuOptionRowView (viewModel2: viewModel)
                    }

               }
                

                
                Spacer()
            }
        }
        
        
    }
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


