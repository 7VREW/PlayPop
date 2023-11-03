//
//  ProfileView.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var data: UserData
    
    var badgeColors = [LinearGradient(colors: [Color(.systemOrange), Color(.systemYellow)], startPoint: .leading, endPoint: .trailing), LinearGradient(colors: [Color(.systemIndigo), Color(.systemPurple)], startPoint: .leading, endPoint: .trailing), LinearGradient(colors: [Color(.systemBlue), Color(.systemCyan)], startPoint: .leading, endPoint: .trailing)]
    
    var body: some View {
        HStack(spacing: 25) {
            
            //Image profile
            ZStack {
                ProfilePicture()
            
                //Note étoiles
                HStack {
                    Text(String(format: "%.1f", data.user.pNotes))
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemYellow))
                    Image(systemName: "star.fill")
                        .foregroundStyle(badgeColors[0])
                }
                .offset(y: 85)
            }
            
            
            //Nom age
            VStack(alignment: .leading, spacing: 17) {
                VStack (alignment: .leading){
                    HStack {
                        Text(data.user.pName)
                            .font(.headline)
                            .lineLimit(1)
                    
        
                        Text(String(data.user.pAge))
                            .foregroundStyle(Color(.systemYellow))
                    }
                    
                    NavigationLink("Editer le profil") {
                        EcranEditerProfile()
                    }
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
        .environmentObject(dataDev)
}
