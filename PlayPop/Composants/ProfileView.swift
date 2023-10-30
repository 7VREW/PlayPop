//
//  ProfileView.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    var badgeColors = [LinearGradient(colors: [Color(.systemOrange), Color(.systemYellow)], startPoint: .leading, endPoint: .trailing), LinearGradient(colors: [Color(.systemIndigo), Color(.systemPurple)], startPoint: .leading, endPoint: .trailing), LinearGradient(colors: [Color(.systemBlue), Color(.systemCyan)], startPoint: .leading, endPoint: .trailing)]
    
    var body: some View {
        HStack(spacing: 25) {
            
            //Image profile
            ZStack {
                Image("karting1")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 125, height: 125)
                    .overlay(Circle()
                    .stroke(LinearGradient(colors: [Color(.systemOrange), Color(.systemYellow)], startPoint: .leading, endPoint: .trailing), lineWidth:5))
            
                //Note étoiles
                HStack {
                    Text("4,6")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemYellow))
                    Image(systemName: "star.fill")
                        .foregroundStyle(badgeColors[0])
                }
                .offset(y: 85)
            }
            
            
            //Nom age
            VStack(alignment: .leading, spacing: 17) {
                HStack {
                    Text("Jean Dupond")
                        .font(.headline)
                        .lineLimit(1)
                
    
                    Text("14 ans")
                        .foregroundStyle(Color(.systemYellow))
                }
                
                //Game evolution section
                VStack (alignment: .leading) {
                    //Barre de progression
                    ProgressView(value: 0.75) {
                        HStack {
                            Text("Niveau 48")
                                .font(.body)
                        
                            Spacer()
                            
                            Text("769 EXP")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                        
                    }
                    .tint(Color(.systemOrange))
                    
                    
                    //Badges obtenus
                    HStack {
                        Image(systemName: "skateboard.fill")
                            .foregroundStyle(badgeColors[0])
                        Image(systemName: "staroflife.shield.fill")
                            .foregroundStyle(badgeColors[1])
                        Image(systemName: "rainbow")
                            .foregroundStyle(badgeColors[2])
                    }
                }
            }
        }
        .padding(.bottom, 35)
        
    }
}

#Preview {
    ProfileView()
}
