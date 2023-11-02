//
//  ParticipantNbSelection.swift
//  PlayPop
//
//  Created by Émilio Williame on 31/10/2023.
//

import SwiftUI

struct NumberPicker: View {
    
    @State var pMin: Int
    @State var pMax: Int
    @State var showPicker = false
    
    var body: some View {
        
//        Menu("Age") {
        ZStack{
        VStack {
            Button {
                withAnimation(.spring(duration: 0.18)) {
                    showPicker.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: "person.2.fill")
                    HStack(spacing: 5) {
                        Text("Min \(pMin)")
                            .foregroundStyle(Color(.systemOrange))
                        Text("/")
                        Text("Max \(pMax)")
                    }
                }
                .foregroundStyle(.primary)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                
            }
            .tint(.secondary)
            
        }
        .overlay {
            ZStack {
                
                VStack(spacing: 25){
                    
                    //Selection du min
                    Stepper("Min",
                            onIncrement: {
                        if pMin >= pMax {
                            pMin = pMax
                        } else {
                            pMin += 1
                        }
                    },
                            onDecrement: {if pMin <= 2 {
                                pMin = 2
                            } else {
                                pMin -= 1
                            }
                    }
                    )
                    
                    //Selection du max
                    Stepper("Max",
                            onIncrement: {if pMax <= 100 {
                                pMax += 1
                            } else {
                                pMax = 100
                            }
                    },
                            onDecrement: {if pMax <= pMin {
                                pMax = pMin
                            } else {
                            pMax -= 1
                            }
                    }
                    )
                    
                    //Valider bouton
                    Button {
                        withAnimation(.spring(duration: 0.18)) {
                            showPicker = false
                        }
                    } label: {
                        Text("Valider")
                            .tint(.primary)
                            .padding(.horizontal, 45)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray5))
                            .clipShape(Capsule())
                    }
                    
                }
                .padding()
                .frame(width: 180, height: showPicker ? 180 : 0)
                .background (.white.opacity(0.2))
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .offset(y: 116)
            }
        }

        }
//        }

    }
}

#Preview {
    NumberPicker(pMin: 18, pMax: 20, showPicker: true)
}
