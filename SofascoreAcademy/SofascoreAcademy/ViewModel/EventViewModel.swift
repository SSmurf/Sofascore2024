//
//  EventViewModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import Foundation
import UIKit

class EventViewModel {
    private let event: EventModel
    private let dateFormatter: DateFormatter
    
    var startTime: String {
        dateFormatter.string(from: event.startTime)
    }
    
    var liveTime: Int? {
        event.liveTime
    }
    
    var homeTeam: String {
        event.homeTeam
    }
    
    var awayTeam: String {
        event.awayTeam
    }
    
    var homeTeamImage: UIImage? {
        UIImage(named: event.homeTeamImageName)
    }
    
    var awayTeamImage: UIImage? {
        UIImage(named: event.awayTeamImageName)
    }
    
    var homeScore: String {
        guard let score = event.homeScore else { return "" }
        return String(score)
    }
    
    var awayScore: String {
        guard let score = event.awayScore else { return "" }
        return String(score)
    }
    
    var eventStatus: EventStatus {
        event.eventStatus
    }
    
    var matchStatusText: String {
        switch event.eventStatus {
        case .notStarted:
            return "-"
        case .inProgress:
            if let liveTime = liveTime {
                return "\(liveTime)'"
            } else {
                return "Live"
            }
        case .finished:
            return "FT"
        }
    }
    
    init(event: EventModel) {
        self.event = event
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "HH:mm"
    }
}
