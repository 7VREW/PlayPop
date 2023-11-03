//
//  SwiftUIView.swift
//  PlayPop
//
//  Created by apprenant50 on 02/11/2023.
//

import SwiftUI

struct EcranAterrissage: View {
    
    @StateObject var data: UserData
    
    var body: some View {
        NavigationStack {
            if data.user.pComplete {
                EcranAccueil4()
            } else {
                EcranAccueil1()
            }
        }
        .tint(.primary)
        .environmentObject(data)
    }
}

#Preview {
    EcranAterrissage(data: dataDev)
}
