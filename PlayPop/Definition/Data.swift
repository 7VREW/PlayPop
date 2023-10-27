import Foundation

var typeTagsList = [
    Tag(tId: 0, tLabel: "bouger"),
    Tag(tId: 1, tLabel: "compétition"),
    Tag(tId: 2, tLabel: "contemplation"),
    Tag(tId: 3, tLabel: "coopération"),
    Tag(tId: 4, tLabel: "création"),
    Tag(tId: 5, tLabel: "culture"),
    Tag(tId: 6, tLabel: "détente"),
    Tag(tId: 7, tLabel: "frayeur"),
    Tag(tId: 8, tLabel: "groupe"),
    Tag(tId: 9, tLabel: "humour"),
    Tag(tId: 10, tLabel: "imagination"),
    Tag(tId: 11, tLabel: "improvisation"),
    Tag(tId: 12, tLabel: "musique"),
    Tag(tId: 13, tLabel: "nature"),
    Tag(tId: 14, tLabel: "rencontres"),
    Tag(tId: 15, tLabel: "sensations"),
    Tag(tId: 16, tLabel: "technique")
]

var accessTagsList = [
    Tag(tId: 100, tLabel: "exterieur"),
    Tag(tId: 101, tLabel: "interieur"),
    Tag(tId: 102, tLabel: "gratuit"),
    Tag(tId: 103, tLabel: "moins de 10 €"),
    Tag(tId: 104, tLabel: "entre 10 et 20 €"),
    Tag(tId: 105, tLabel: "plus de 20 €")
]

var leasureList = [
    
    Leasure(lLabel: "Jeu de Rôle", lTags: [typeTagsList[8], typeTagsList[11], typeTagsList[3], typeTagsList[10], accessTagsList[1], accessTagsList[2]], lDesc: "", lImage: ["jdr1", "jdr2", "jdr3"], lEvents: []),
    Leasure(lLabel: "Club de Lecture", lTags: [typeTagsList[2], typeTagsList[6], typeTagsList[5], typeTagsList[8], accessTagsList[1], accessTagsList[2]], lDesc: "", lImage: ["readingClub1", "readingClub2", "readingClub3"], lEvents: []),
    Leasure(lLabel: "Bowling", lTags: [typeTagsList[1], typeTagsList[6], typeTagsList[8], typeTagsList[9], typeTagsList[14], accessTagsList[1], accessTagsList[3]], lDesc: "", lImage: ["bowling1", "bowling2", "bowling3"], lEvents: []),
    Leasure(lLabel: "Film d'Horreur", lTags: [typeTagsList[2], typeTagsList[5], typeTagsList[7], typeTagsList[15], accessTagsList[1], accessTagsList[4]], lDesc: "", lImage: ["horrorMovies1", "horrorMovies2", "horrorMovies3"], lEvents: []),
    Leasure(lLabel: "Théatre d'improvisation", lTags: [typeTagsList[3], typeTagsList[9], typeTagsList[10], typeTagsList[11], typeTagsList[14], accessTagsList[1], accessTagsList[2]], lDesc: "", lImage: ["theater1", "theater2", "theater3"], lEvents: []),
    Leasure(lLabel: "Jardinage colaboratif", lTags: [typeTagsList[3], typeTagsList[6], typeTagsList[13], typeTagsList[14], accessTagsList[0], accessTagsList[2]], lDesc: "", lImage: ["gardening1", "gardening2", "gardening3"], lEvents: []),
    Leasure(lLabel: "Danse Hip-Hop", lTags: [typeTagsList[0], typeTagsList[3], typeTagsList[5], typeTagsList[12], typeTagsList[14], accessTagsList[0], accessTagsList[1], accessTagsList[2]], lDesc: "", lImage: ["hipHopDanse1", "hipHopDanse2", "hipHopDanse3"], lEvents: []),
    Leasure(lLabel: "Skate", lTags: [typeTagsList[0], typeTagsList[5], typeTagsList[14], typeTagsList[15], accessTagsList[0], accessTagsList[2]], lDesc: "", lImage: ["skate1", "skate2", "skate3"], lEvents: []),
    Leasure(lLabel: "Ping Pong", lTags: [typeTagsList[0], typeTagsList[1], typeTagsList[3], accessTagsList[0], accessTagsList[1], accessTagsList[3]], lDesc: "", lImage: ["pingPong1", "pingPong2", "pingPong3"], lEvents: []),
    Leasure(lLabel: "Guitare", lTags: [typeTagsList[4], typeTagsList[5], typeTagsList[16], accessTagsList[1]], lDesc: "", lImage: ["electricGuitar1", "electricGuitar2", "electricGuitar3"], lEvents: []),
    Leasure(lLabel: "Karting", lTags: [typeTagsList[0], typeTagsList[1], typeTagsList[15], accessTagsList[0], accessTagsList[4]], lDesc: "", lImage: ["karting1", "karting2", "karting3"], lEvents: [])
    
]
