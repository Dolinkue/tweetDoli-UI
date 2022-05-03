//
//  RoundedShape.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 03/05/2022.
//

import SwiftUI


struct RoundedShape: Shape {
    
    var corders: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corders, cornerRadii: CGSize(width: 80.0, height: 80.0))
        
        return Path(path.cgPath)
    }
    
    
}
