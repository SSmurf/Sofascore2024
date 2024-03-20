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
    
    private let leagueView = LeagueView()
    private let eventsContainerView = UIView()
    
    override func addViews() {
        addSubview(leagueView)
        addSubview(eventsContainerView)
    }
    
    override func setupConstraints() {
        leagueView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        eventsContainerView.snp.makeConstraints { make in
            make.top.equalTo(leagueView.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    func configure(with leagueViewModel: LeagueViewModel, events: [EventModel]) {
        leagueView.configure(with: leagueViewModel)
        
        var previousEventView: UIView? = nil
        
        for event in events {
            let eventView = EventView()
            eventView.configure(with: EventViewModel(event: event))
            eventsContainerView.addSubview(eventView)
            
            eventView.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                
                if let previousEventView = previousEventView {
                    make.top.equalTo(previousEventView.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
            }
            
            previousEventView = eventView
        }
        
        previousEventView?.snp.makeConstraints { make in
              make.bottom.equalToSuperview()
        }
    }
}

