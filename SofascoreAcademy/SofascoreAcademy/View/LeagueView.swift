//
//  LeagueView.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 12.03.2024..
//

import UIKit
import SnapKit
import SofaAcademic

class LeagueView: BaseView {
    
    private let leagueImageView = UIImageView()
    private let countryLabel = UILabel()
    private let pointerImageView = UIImageView()
    private let leagueNameLabel = UILabel()
    
    
    override func addViews() {
        super.addViews()
        addSubview(leagueImageView)
        addSubview(countryLabel)
        addSubview(pointerImageView)
        addSubview(leagueNameLabel)
    }
    
    override func styleViews() {
        super.styleViews()
        
        leagueImageView.contentMode = .scaleAspectFit
        leagueImageView.clipsToBounds = true
        
        countryLabel.textAlignment = .left
//        countryLabel.font = .headline3
        countryLabel.font = countryLabel.font.withSize(14)
        countryLabel.textColor = UIColor.onSurfaceOnSurfaceLv1
        countryLabel.numberOfLines = 1
        
        pointerImageView.contentMode = .scaleAspectFit
        pointerImageView.clipsToBounds = true
        
        leagueNameLabel.textAlignment = .left
//        leagueNameLabel.font = UIFont.headline3
        leagueNameLabel.font = leagueNameLabel.font.withSize(14)
        leagueNameLabel.textColor = UIColor.onSurfaceOnSurfaceLv2
        leagueNameLabel.numberOfLines = 1
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        leagueImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(32)
        }
        
        countryLabel.snp.makeConstraints { make in
            make.centerY.equalTo(leagueImageView)
            make.leading.equalTo(leagueImageView.snp.trailing).offset(32)
        }
        
        pointerImageView.snp.makeConstraints { make in
            make.centerY.equalTo(countryLabel)
            make.leading.equalTo(countryLabel.snp.trailing)
            make.width.height.equalTo(24)
        }
        
        leagueNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(pointerImageView)
            make.leading.equalTo(pointerImageView.snp.trailing)
            make.trailing.lessThanOrEqualToSuperview().inset(10)
        }
    }
    
    func configure(with viewModel: LeagueViewModel) {
        leagueImageView.image = viewModel.image
        countryLabel.text = viewModel.country
        pointerImageView.image = viewModel.pointerImage
        leagueNameLabel.text = viewModel.leagueName
    }
}


