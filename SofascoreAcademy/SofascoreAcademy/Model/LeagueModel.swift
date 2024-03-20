//
//  LeagueModel.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import Foundation
import UIKit

struct LeagueModel {
    let imageName: String
    let country: String
    let leagueName: String
}

extension LeagueModel {
    var image: UIImage? {
        UIImage(named: imageName)
    }
}

let mockLeague = LeagueModel(imageName: "laliga_icon", country: "Spain", leagueName: "LaLiga")
