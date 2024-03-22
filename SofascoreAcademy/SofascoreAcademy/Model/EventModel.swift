//
//  MatchModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import UIKit

enum EventStatus: String {
    case notStarted = "notStarted"
    case inProgress = "inProgress"
    case finished = "finished"
}

struct EventModel {
    let id: UUID
    let startTime: Date
    let liveTime: Int?
    let homeTeam: String
    let awayTeam: String
    let homeTeamImageName: String
    let awayTeamImageName: String
    let homeScore: Int?
    let awayScore: Int?
    let eventStatus: EventStatus
}

extension Int {
    var dateFromTimestamp: Date {
        Date(timeIntervalSince1970: TimeInterval(self))
    }
}

extension EventModel {
    var homeTeamImage: UIImage? {
        UIImage(named: homeTeamImageName)
    }
    
    var awayTeamImage: UIImage? {
        UIImage(named: awayTeamImageName)
    }
}

let mockEvents: [EventModel] = [
    EventModel(id: UUID(), startTime: 1678807200.dateFromTimestamp, liveTime: nil, homeTeam: "Manchester United", awayTeam: "Barcelona", homeTeamImageName: "manchester_united_icon", awayTeamImageName: "barcelona_icon", homeScore: 1, awayScore: 2, eventStatus: .finished),
    EventModel(id: UUID(), startTime: 1678810800.dateFromTimestamp, liveTime: 36, homeTeam: "Manchester United", awayTeam: "Barcelona", homeTeamImageName: "manchester_united_icon", awayTeamImageName: "barcelona_icon", homeScore: 0, awayScore: 1, eventStatus: .inProgress),
    EventModel(id: UUID(), startTime: 1678814400.dateFromTimestamp, liveTime: nil, homeTeam: "Manchester United", awayTeam: "Barcelona", homeTeamImageName: "manchester_united_icon", awayTeamImageName: "barcelona_icon", homeScore: nil, awayScore: nil, eventStatus: .notStarted),
    EventModel(id: UUID(), startTime: 1678818000.dateFromTimestamp, liveTime: nil, homeTeam: "Manchester United", awayTeam: "Barcelona", homeTeamImageName: "manchester_united_icon", awayTeamImageName: "barcelona_icon", homeScore: nil, awayScore: nil, eventStatus: .notStarted),
]
