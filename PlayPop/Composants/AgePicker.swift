//
//  AgePicker.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct AgePicker: View {
    
    @State var userAge: Int
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
                Text("Your age")
            }
            .tint(.primary)
            
        }
            
                ZStack {
                    if showPicker{
                        Color.black.opacity(0.1)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showPicker = false
                                }
                            }
                    }
                    VStack{
                        Picker("Your age", selection: $userAge) {
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
                    .offset(y: 106)
                }
        }
//        }

    }
}

#Preview {
    AgePicker(userAge: 18)
}
