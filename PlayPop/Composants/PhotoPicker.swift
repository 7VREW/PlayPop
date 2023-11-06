//
//  PhotoPicker.swift
//  PlayPop
//
//  Created by apprenant50 on 02/11/2023.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    
    @State private var photoItems = [PhotosPickerItem]()
    
    @Binding var photoImages: [Image]

    var body: some View {
        TabView {
            
            // Affichage des images
            ForEach(0..<photoImages.count, id: \.self) { i in
                photoImages[i]
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 360)
            }

            // Selection d'images
            PhotosPicker(selection: $photoItems, matching: .images, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.quinary)
                        .frame(width: 393, height: 360)
                    
                    VStack{
                        Text("Ajouter des images")
                            .font(.headline)
                        Image(systemName: "plus")
                            .padding(7)
                            .font(.title2)
                            .background(.quaternary)
                            .clipShape(Capsule())
                    }
                }
            })
        }
        
        // Encadrement de la selection
        .frame(height: 360)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .tint(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        
        // Sauvegarde des images
        .onChange(of: photoItems) { _ in
            Task {
                photoImages.removeAll()
                    
                for item in photoItems {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            let image = Image(uiImage: uiImage)
                            photoImages.append(image)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    PhotoPicker(photoImages: .constant([]))
}
