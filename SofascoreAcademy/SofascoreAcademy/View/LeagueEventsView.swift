//
//  LeagueEventsView.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 17.03.2024..
//

import UIKit
import SnapKit
import SofaAcademic

class LeagueEventsView: BaseView {
    
    private let stackView = UIStackView()
    
    override func addViews() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        
        addSubview(stackView)
    }
    
    override func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(with leagueViewModel: LeagueViewModel, events: [EventModel]) {
        let leagueView = LeagueView()
        leagueView.configure(with: leagueViewModel)
        
        stackView.addArrangedSubview(leagueView)
              
        for event in events {
            let eventView = EventView()
            eventView.configure(with: EventViewModel(event: event))
            stackView.addArrangedSubview(eventView)
        }
    }
}

