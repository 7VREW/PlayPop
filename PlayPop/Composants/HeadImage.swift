/* 
Image qui doit s'afficher en haut de l'écran.
Peut swiper entre plusieurs images.
C'est normal si l'image n'est pas centrée par défault, ça va le faire avec un .ignoreSageArea()
 
Prends une liste d'images en argument
*/


import SwiftUI

struct HeadImage: View {
    
    var imageList: [Image]
    
    var body: some View {
        
        ZStack {
                        TabView{
                            ForEach(0..<imageList.count){index in
                                ZStack {
                                    imageList[index]
                                        .resizable()
                                        .scaledToFill()
                                    LinearGradient(colors: [.white.opacity(0.75), .clear], startPoint: .top, endPoint: .center)
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(width: 393, height: 360)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        .frame(width: 393, height: 300, alignment: .bottom)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(radius: 5)
    }
}

#Preview {
    HeadImage(imageList: leasureList[2].lImage)
}
