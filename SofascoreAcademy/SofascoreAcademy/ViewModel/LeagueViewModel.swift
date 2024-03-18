//
//  LeagueViewModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import UIKit

class LeagueViewModel {
    // MARK: - Properties
    private let league: LeagueModel
    
    // MARK: - Computed Properties for View Presentation
    var image: UIImage? {
        return UIImage(named: league.imageName)
    }
    
    var country: String {
        return league.country
    }
    
    var leagueName: String {
        return league.leagueName
    }
    
    // MARK: - Initialization
    init(league: LeagueModel) {
        self.league = league
    }
}

