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
        
//        Menu("Age") {
        ZStack{
        VStack {
            Button {
                withAnimation {
                    showPicker = true
                }
            } label: {
                Text("Selection : **\(data.user.pAge)** ans")
                    .font(.title3)
                
            }
            .tint(.secondary)
            
        }
            
                ZStack {
                    
                    VStack{
                        Picker("Your age", selection: $data.user.pAge) {
                            ForEach(12...99, id: \.self) { number in
                                Text("\(number)")
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    .frame(width: 200, height: showPicker ? 180 : 0)
                    .background (.white.opacity(0.2))
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .offset(y: 116)
                }
        }
//        }

    }
}

#Preview {
    AgePicker()
        .environmentObject(dataDev)
}
