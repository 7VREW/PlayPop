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
    @State private var avatarImage: Image?
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $avatarItem, matching: .images, label: {
                ZStack {
                    Circle()
                        .frame(width: 125)
                        .foregroundStyle(.ultraThinMaterial)
                        
                    Image(systemName: "plus.circle")
                        .font(.system(size: 36))
                        .foregroundStyle(Color(.systemGray3))
                    
                    if let avatarImage {
                        avatarImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                    }
                }
            })
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilePicture()
}
