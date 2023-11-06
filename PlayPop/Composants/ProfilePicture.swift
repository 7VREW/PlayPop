//
//  ProfilePicture.swift
//  PlayPop
//
//  Created by Émilio Williame on 03/11/2023.
//

import PhotosUI
import SwiftUI

struct ProfilePicture: View {
    
    @State private var avatarItem: PhotosPickerItem?
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        VStack {
            
            // Selection de l'image
            PhotosPicker(selection: $avatarItem, matching: .images, label: {
                ZStack {
                    
                    // Affichage de l'image
                    Circle()
                        .frame(width: 125)
                        .foregroundStyle(.ultraThinMaterial)
                        
                    Image(systemName: "plus.circle")
                        .font(.system(size: 36))
                        .foregroundStyle(Color(.systemGray3))
                    
                    data.user.pAvatar
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                }
            })
        }
        
        // Sauvegarde de l'image
        .onChange(of: avatarItem) { _ in
            Task {
                if let datum = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: datum) {
                        data.user.pAvatar = Image(uiImage: uiImage)
                        return
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilePicture()
        .environmentObject(dataDev)
}
