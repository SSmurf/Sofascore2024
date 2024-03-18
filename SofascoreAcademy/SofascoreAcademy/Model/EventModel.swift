//
//  MatchModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import Foundation

enum MatchStatus: String {
    case notStarted = "notStarted"
    case inProgress = "inProgress"
    case finished = "finished"
}

struct Match {
    let id: UUID
    let startTime: Date
    let homeTeam: String
    let awayTeam: String
    let homeScore: Int?
    let awayScore: Int?
    let matchStatus: MatchStatus
}
