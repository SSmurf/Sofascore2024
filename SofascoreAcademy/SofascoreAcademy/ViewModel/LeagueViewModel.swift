//
//  LeagueViewModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import UIKit

class LeagueViewModel {
    private let league: LeagueModel
    
    var image: UIImage? {
        UIImage(named: league.imageName)
    }
    
    var pointerImage: UIImage? {
        UIImage(named: "ic-pointer-right")
    }
    
    var country: String {
        league.country
    }
    
    var leagueName: String {
        league.leagueName
    }
    
    init(league: LeagueModel) {
        self.league = league
    }
}

