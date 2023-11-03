import Foundation
import SwiftUI

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

var jDP = Profile(pComplete: false, pName: "", pAge: 12, pNotes: [], pBio: "", pAnswers: [], pAvatar: Image(""), pXP: 0, pBadges: [])

var jDPDev = Profile(id: UUID(), pComplete: true, pName: "Jean Dupont", pAge: 14, pNotes: [4.6], pBio: "Salut j'aime le karting je pratique du skate et la nomenclature de cette text box m'ennui. J'ai 12 ans en réalité", pAnswers: accessTagsList, pAvatar: Image("karting1"), pXP: 48.795, pBadges: [])

var leasureList = [
    Leasure(lLabel: "Jeu de Rôle", lTags: [typeTagsList[8], typeTagsList[11], typeTagsList[3], typeTagsList[10], accessTagsList[1], accessTagsList[2]], lDesc: "Plongez dans des mondes fantastiques et laissez libre cours à votre imagination. Incarnez des personnages épiques, résolvez des énigmes captivantes et vivez des aventures extraordinaires avec vos amis. Le jeu de rôle est une expérience immersive qui stimule la créativité et favorise le travail d'équipe, offrant des heures de divertissement sans fin.", lImage: [Image("jdr1"), Image("jdr2"), Image("jdr3")], lNotes: []),
    Leasure(lLabel: "Club de Lecture", lTags: [typeTagsList[2], typeTagsList[6], typeTagsList[5], typeTagsList[8], accessTagsList[1], accessTagsList[2]], lDesc: "Plongez-vous dans des univers littéraires captivants en rejoignant un club de lecture. Partagez vos impressions et opinions sur des livres fascinants avec d'autres passionnés de lecture. Découvrez de nouveaux auteurs, explorez divers genres littéraires et élargissez vos horizons intellectuels grâce à des discussions animées et enrichissantes. Le club de lecture offre une expérience sociale et intellectuelle gratifiante pour tous les amateurs de livres.", lImage: [Image("readingClub1"), Image("readingClub2"), Image("readingClub3")], lNotes: []),
    Leasure(lLabel: "Bowling", lTags: [typeTagsList[1], typeTagsList[6], typeTagsList[8], typeTagsList[9], typeTagsList[14], accessTagsList[1], accessTagsList[3]], lDesc: "Détendez-vous avec des amis ou en famille tout en visant à renverser tous les quilles avec précision. Défiez-vous les uns les autres dans une ambiance détendue et compétitive, tout en profitant d'une expérience divertissante qui allie compétence, concentration et convivialité. Le bowling offre un passe-temps social amusant qui convient à tous les âges et à tous les niveaux d'habileté.", lImage: [Image("bowling1"), Image("bowling2"), Image("bowling3")], lNotes: []),
    Leasure(lLabel: "Film d'Horreur", lTags: [typeTagsList[2], typeTagsList[5], typeTagsList[7], typeTagsList[15], accessTagsList[1], accessTagsList[4]], lDesc: "Explorez l'univers sombre et captivant des films d'horreur, où le suspense et les frissons vous emmènent dans des histoires palpitantes remplies de mystère et de tension. Plongez dans des intrigues surnaturelles, des thrillers psychologiques et des histoires de monstres effrayants qui vous tiendront en haleine jusqu'à la fin. Les films d'horreur offrent une expérience cinématographique stimulante pour les amateurs d'émotions fortes en quête d'excitation et d'adrénaline.", lImage: [Image("horrorMovies1"), Image("horrorMovies2"), Image("horrorMovies3")], lNotes: []),
    Leasure(lLabel: "Théatre d'improvisation", lTags: [typeTagsList[3], typeTagsList[9], typeTagsList[10], typeTagsList[11], typeTagsList[14], accessTagsList[1], accessTagsList[2]], lDesc: "Laissez libre cours à votre spontanéité et à votre créativité en participant à des scènes théâtrales sans script préétabli. Explorez l'art de la répartie rapide, du jeu de rôle et de la narration spontanée, tout en développant vos compétences en communication et en travail d'équipe. Le théâtre d'improvisation offre une expérience divertissante et stimulante qui favorise la confiance en soi et la pensée agile.", lImage: [Image("theater1"), Image("theater2"), Image("theater3")], lNotes: []),
    Leasure(lLabel: "Jardinage colaboratif", lTags: [typeTagsList[3], typeTagsList[6], typeTagsList[13], typeTagsList[14], accessTagsList[0], accessTagsList[2]], lDesc: "Participez à une expérience de jardinage enrichissante en collaborant avec d'autres passionnés de la nature. Échangez des connaissances, partagez des conseils et cultivez ensemble un espace verdoyant propice à la croissance de plantes variées. Le jardinage collaboratif favorise la camaraderie, l'apprentissage mutuel et la création d'un environnement florissant qui apporte satisfaction et harmonie à tous les participants.", lImage: [Image("gardening1"), Image("gardening2"), Image("gardening3")], lNotes: []),
    Leasure(lLabel: "Danse Hip-Hop", lTags: [typeTagsList[0], typeTagsList[3], typeTagsList[5], typeTagsList[12], typeTagsList[14], accessTagsList[0], accessTagsList[1], accessTagsList[2]], lDesc: "Exprimez-vous à travers des mouvements fluides et des rythmes dynamiques en plongeant dans la culture vibrante du hip-hop. Explorez l'art de la breakdance, du popping, du locking et d'autres styles de danse urbaine, tout en laissant votre énergie créative s'épanouir. La danse hip-hop offre une façon dynamique de rester en forme tout en développant la confiance en soi et le sens du rythme.", lImage: [Image("hipHopDanse1"), Image("hipHopDanse2"), Image("hipHopDanse3")], lNotes: []),
    Leasure(lLabel: "Skate", lTags: [typeTagsList[0], typeTagsList[5], typeTagsList[14], typeTagsList[15], accessTagsList[0], accessTagsList[2]], lDesc: "Maîtrisez l'art de la glisse et ressentez l'adrénaline en défiant la gravité sur votre planche. Que ce soit pour faire des figures impressionnantes dans un skatepark ou pour explorer les rues de la ville, le skate offre une sensation de liberté et un moyen unique de s'exprimer. Améliorez votre équilibre, votre coordination et profitez d'une expérience enrichissante, synonyme de passion et de défi constant.", lImage: [Image("skate1"), Image("skate2"), Image("skate3")], lNotes: []),
    Leasure(lLabel: "Ping Pong", lTags: [typeTagsList[0], typeTagsList[1], typeTagsList[3], accessTagsList[0], accessTagsList[1], accessTagsList[3]], lDesc: "Affinez votre agilité et votre précision en participant à des échanges rapides et dynamiques. Que ce soit pour le plaisir décontracté entre amis ou pour des compétitions intenses, le ping-pong offre une activité divertissante qui améliore vos réflexes et favorise la concentration. Développez votre stratégie de jeu et profitez d'un sport engageant qui convient à tous les niveaux de compétence.", lImage: [Image("pingPong1"), Image("pingPong2"), Image("pingPong3")], lNotes: []),
    Leasure(lLabel: "Guitare", lTags: [typeTagsList[4], typeTagsList[5], typeTagsList[16], accessTagsList[1]], lDesc: "Laissez libre cours à votre créativité musicale en apprenant à jouer de la guitare. Plongez dans les mélodies envoûtantes et les accords captivants, en explorant un large éventail de genres musicaux. Que vous soyez un débutant passionné ou un musicien expérimenté, la guitare offre une expérience gratifiante qui stimule la coordination, la patience et l'expression artistique.", lImage: [Image("electricGuitar1"), Image("electricGuitar2"), Image("electricGuitar3")], lNotes: []),
    Leasure(lLabel: "Karting", lTags: [typeTagsList[0], typeTagsList[1], typeTagsList[15], accessTagsList[0], accessTagsList[4]], lDesc: "Faites le plein d'adrénaline en prenant le volant d'un kart et en ressentant la vitesse sur la piste. Défiez vos amis ou votre famille dans des courses palpitantes où chaque virage compte. Le karting offre une expérience exaltante pour les passionnés de vitesse et les amateurs de compétition, tout en développant vos compétences en matière de pilotage et de prise de décision rapide.", lImage: [Image("karting1"), Image("karting2"), Image("karting3")], lNotes: [])
    
]

var eventList = [horrorEvent1, skateEvent1, jDREvent1, lectureEvent1, theatreEvent1, eventBowling1, eventBowling2, eventGarden1, pingPong1, karting1, guitarEvent1]

var data = UserData(user: jDP, leasureList: leasureList, eventList: [])

var dataDev = UserData(user: jDPDev, leasureList: leasureList, eventList: eventList)
