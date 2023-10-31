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
                Image(systemName: "chevron.up")
            }
            .font(.system(size: 30))
        })
        .foregroundStyle(.background)
    }
}

               
#Preview {
    ProfileButton()
}
