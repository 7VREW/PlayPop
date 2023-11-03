//
//  RatingStars.swift
//  PlayPop
//
//  Created by Émilio Williame on 03/11/2023.
//

import SwiftUI

struct RatingStars: View {
    @Binding var rating: Int

    @State var label: String

    var maxRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color(.systemGray5)
    var onColor = Color(.systemOrange)
    
    var body: some View {
        VStack(spacing: 20) {
            Text(label)
                .font(.headline)
                HStack{
                    ForEach(1..<maxRating + 1, id:\.self){number in
                        image(for: number)
                            .font(.title)
                            .foregroundColor(number>rating ? offColor : onColor)
                            .onTapGesture {
                                rating = number
                                }
                            }
                    }
                }
        .padding(.top, 25)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
}

#Preview {
    RatingStars(rating: .constant(5), label: "Test")
}
