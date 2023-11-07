//
//  SplashScreen.swift
//  PlayPop
//
//  Created by Émilio Williame on 06/11/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    @State var iconAction: Bool = false
    @StateObject var data: UserData
    
    var body: some View {
        ZStack {
            if self.isActive {
                EcranAterrissage()
            } else {
                ZStack {
                    Image("LaunchImage")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("LaunchIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconAction ? 200: 150, height: iconAction ? 200: 150)
                        .animation(.bouncy(extraBounce: 0.3), value: iconAction)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.iconAction.toggle()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut) {
                    self.isActive = true
                        }
                    }
                }
        .environmentObject(data)
            }
        }


#Preview {
    SplashScreen(data: dataDev)
        .environmentObject(dataDev)
}
