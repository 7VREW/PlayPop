//
//  Structures.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import Foundation
import SwiftUI

//User profile
struct Profile: Identifiable{
    var id = UUID()
    var pComplete: Bool
    var pName: String
    var pAge: Int
    var pNotes: [Double]
    var pBio: String
    var pAnswers: [Tag]
    var pAvatar: Image
    var pXP: Double
    var pBadges: [String]
}


//Les tags de fou pour toute l'application en entière full fully complete
struct Tag: Identifiable{
    var id = UUID()
    var tId: Int
    var tLabel: String
}

//Detail du loisir
struct Leasure: Identifiable{
    var id = UUID()
    var lLabel: String
    var lTags: [Tag]
    var lDesc: String
    var lImage: [Image]
    var lNotes: [Double]
}

//Detail évènement
struct Event: Identifiable{
    @StateObject private var mapAPI = MapAPI()
    var id = UUID()
    var eLabel: String
    var eDesc: String
    var eLeasure: Int
    var eImage: [Image]
    var eMinU: Int
    var eMaxU: Int
    var eUsersList: [UUID]
    var eLocation: Location
    var eDate: Date
    var ePast: Bool
    var eActualNumberParticipant: Int

}

class UserData: ObservableObject{
    @Published var user: Profile
    @Published var leasureList: [Leasure]
    @Published var eventList: [Event]
    @Published var userImage: Image?
    
    init(user: Profile, leasureList: [Leasure], eventList: [Event]) {
        self.user = user
        self.leasureList = leasureList
        self.eventList = eventList
    }
}
