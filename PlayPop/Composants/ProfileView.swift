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
    
    func rating ()-> Double {
        var stars: Double = 0

        
        for rate in data.user.pNotes {
            stars += rate
        }
        
        return stars/Double(data.user.pNotes.count)
    }
    
    var body: some View {
        HStack(spacing: 25) {
            
            //Image profile
            ZStack {
                ProfilePicture()
            
                //Note étoiles
                HStack {
                    if data.user.pNotes.count > 0 {
                        Text(String(format: "%.1f", rating()))
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemYellow))
                    } else {
                        Text("N/A")
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemYellow))
                    }
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
                    ProgressView(value: data.user.pXP-(Double(Int(data.user.pXP)))) {
                        HStack {
                            Text("Niveau : \(Int(data.user.pXP))")
                                .font(.body)
                        
                            Spacer()
                            
                            Text("\(Int((data.user.pXP*1000))%1000) EXP")
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
