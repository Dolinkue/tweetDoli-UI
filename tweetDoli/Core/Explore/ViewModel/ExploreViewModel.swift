//
//  ExploreViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 08/05/2022.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users = [User1]()
    
    @Published var searchText = ""
    
    var searchbleUser: [User1] {
        
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.userName.contains(lowercasedQuery) ||
                $0.fullName.lowercased().contains(lowercasedQuery)
                
            })
        }
        
    }
    
    let service = UserService()
    
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        
        service.fetchUsers { users in
            self.users = users
            
        }
        
    }
    
}
