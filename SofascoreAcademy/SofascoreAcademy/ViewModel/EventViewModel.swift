//
//  EventViewModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import Foundation

class EventViewModel {
    // MARK: - Properties
    private let event: Event
    private let dateFormatter: DateFormatter
    
    // MARK: - Computed Properties for View Presentation
    var matchTime: String {
        return dateFormatter.string(from: event.startTime)
    }
    
    var homeTeam: String {
        return event.homeTeam
    }
    
    var awayTeam: String {
        return event.awayTeam
    }
    
    var homeScore: String {
        guard let score = event.homeScore else { return "" }
        return String(score)
    }
    
    var awayScore: String {
        guard let score = event.awayScore else { return "" }
        return String(score)
    }
    
    var matchStatusText: String {
        switch event.eventStatus {
        case .notStarted:
            return "Not Started"
        case .inProgress:
            return "In Progress"
        case .finished:
            return "Finished"
        }
    }
    
    // MARK: - Initialization
    init(event: Event) {
        self.event = event
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "HH:mm"
    }
}
