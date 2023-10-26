//
//  Structures.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import Foundation

//User profile
struct Profile: Identifiable{
    var id = UUID()
    var pComplete: Bool
    var pName: String
    var pAge: Int
    var pNote: Double
    var pBio: String
    var pEvents: [Event]
    var pEventPast: [Event]
    var pEventToEvaluate: [Event]
    var pAnswers: [Tag]
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
    var lImage: [String]
    var lEvents: [Event]
}

//Detail évènement
struct Event: Identifiable{
    var id = UUID()
    var eLabel: String
    var eDesc: String
    var eLeasure: String
    var eImage: [String]
    var eMinU: Int
    var eMaxU: Int
    var eUsersList: [String]
    var eLocation: String
    var eTags: [Tag]
    var eDate: Date
    var ePast: Bool
}
