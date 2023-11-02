//
//  ValidationAlert.swift
//  PlayPop
//
//  Created by Émilio Williame on 31/10/2023.
//

import SwiftUI

struct ValidationAlert: View {
    
    @State private var validationAlert = false
    
    var body: some View {
        Button("Participer") {
            validationAlert = true
        }
        .alert(isPresented: $validationAlert) {
            Alert(title: Text("🤘 Participation validée"), message: Text("En cliquant sur \"Confirmer\" je m'engage à participer à l'évènement").foregroundStyle(.red), dismissButton: .default(Text("Confirmer")))
        }
    }
}

#Preview {
    ValidationAlert()
}
