//
//  ProfileButton.swift
//  PlayPop
//
//  Created by Apprenant 44 on 27/10/2023.
//

import SwiftUI
struct ProfileButton: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            VStack (spacing: 10) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 35, height: 20)
                    .aspectRatio(contentMode: .fit)
            }
            .foregroundStyle(.primary)
        })
    }
}

               
#Preview {
    ProfileButton()
}
