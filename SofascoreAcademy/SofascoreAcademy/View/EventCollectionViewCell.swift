//
//  EventCollectionViewCell.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 21.03.2024..
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    let eventView = EventView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(eventView)
        eventView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: EventViewModel) {
        eventView.configure(with: viewModel)
    }
}
