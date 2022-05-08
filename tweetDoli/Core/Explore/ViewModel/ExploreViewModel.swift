//
//  ExploreViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 08/05/2022.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    
    @Published var users = [User1]()
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
