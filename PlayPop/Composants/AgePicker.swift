//
//  AgePicker.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct AgePicker: View {
    
    @EnvironmentObject var data: UserData
    @State var showPicker = false
    
    var body: some View {
        

        ZStack{
            VStack {
                
                // Boutton de selection
                Button {
                    withAnimation(.spring(duration: 0.18)) {
                        showPicker.toggle()
                    }
                } label: {
                    Text("Selection : **\(data.user.pAge)** ans")
                        .font(.title3)
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(.tertiary, lineWidth: 0.5)
                        )
                }
                .tint(.secondary)
            }
            
            ZStack {
                VStack{
                    
                    // Menu de selection
                    Picker("Your age", selection: $data.user.pAge) {
                        ForEach(12...99, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                .frame(width: 200, height: 180)
                .background (.white.opacity(0.2))
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .offset(y: 122)
                .scaleEffect(showPicker ? 1 : 0)
            }
        }
    }
}

#Preview {
    AgePicker()
        .environmentObject(dataDev)
}
