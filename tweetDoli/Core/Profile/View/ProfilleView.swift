//
//  ProfilleView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 29/04/2022.
//

import SwiftUI

struct ProfilleView: View {
    var body: some View {
        VStack (alignment: .leading){
           
            headerView
        
            actionbuttons
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Nico dolinkue")
                        .font(.title2).bold()
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Text("@nicoDolinkue")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("alto gato")
                    .font(.subheadline)
                    .padding(.vertical)
                
                HStack(spacing: 24){
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("carmen de areco")
                        
                    }
                    
                    
                    
                    HStack{
                        Image(systemName: "link")
                        Text("github/Dolinkue")
                        
                    }
                }
                .font(.caption)
                .foregroundColor(.gray)
                
                HStack(spacing: 24){
                    
                    HStack(spacing: 4) {
                        Text("200")
                            .font(.subheadline)
                            .bold()
                        Text("Following")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                    
                    HStack(spacing: 4) {
                        Text("1M")
                            .font(.subheadline)
                            .bold()
                        Text("Followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                }
                
                padding(.vertical)
                
                
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
    }
}

struct ProfilleView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilleView()
    }
}

extension ProfilleView {
    
    var headerView: some View {
        
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }

                
                Circle()
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
        
    }
    
    var actionbuttons: some View {
        
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
}
