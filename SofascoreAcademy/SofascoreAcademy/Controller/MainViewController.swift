//
//  MainViewController.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 14.03.2024..
//

import UIKit

class MainViewController: UIViewController {
    
    private var leagueEventsView: LeagueEventsView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            
        leagueEventsView = LeagueEventsView()
        view.addSubview(leagueEventsView)
            
        leagueEventsView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
            
        let leagueViewModel = LeagueViewModel(league: mockLeague)
        leagueEventsView.configure(with: leagueViewModel, events: mockEvents)
    }
}

