//
//  SideMenuViewModel.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 01/05/2022.
//

import Foundation


enum SideMenuViewmodel: Int, CaseIterable   {
    case profile
    case listss
    case bookmarks
    case logout
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .listss: return "Lists"
        case .bookmarks: return "Bookmark"
        case .logout: return "Logout"
        }
     
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .listss: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
    }
}
}
