//
//  EventView.swift
//  SofascoreAcademy
//
//  Created by Anton Pomper on 14.03.2024..
//

import UIKit
import SnapKit
import SofaAcademic

class EventView: BaseView {
    
    private let timeLabel = UILabel()
    private let statusLabel = UILabel()
    private let verticalDivider = UIView()
    private let homeTeamImage = UIImageView()
    private let awayTeamImage = UIImageView()
    private let homeTeamLabel = UILabel()
    private let awayTeamLabel = UILabel()
    private let homeScoreLabel = UILabel()
    private let awayScoreLabel = UILabel()
    
    override func addViews(){
        addSubview(timeLabel)
        addSubview(statusLabel)
        addSubview(verticalDivider)
        addSubview(homeTeamImage)
        addSubview(awayTeamImage)
        addSubview(homeTeamLabel)
        addSubview(awayTeamLabel)
        addSubview(homeScoreLabel)
        addSubview(awayScoreLabel)
    }
    
    override func styleViews(){
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.micro
        timeLabel.textColor = UIColor.onSurfaceOnSurfaceLv2
        
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.micro
        statusLabel.textColor = UIColor.onSurfaceOnSurfaceLv2
        
        verticalDivider.backgroundColor = UIColor.onSurfaceOnSurfaceLv4
        
        homeTeamImage.contentMode = .scaleAspectFit
        homeTeamImage.clipsToBounds = true
        
        awayTeamImage.contentMode = .scaleAspectFit
        awayTeamImage.clipsToBounds = true
        
        homeTeamLabel.textAlignment = .left
        homeTeamLabel.font = UIFont.body
        homeTeamLabel.numberOfLines = 1
        homeTeamLabel.textColor = UIColor.onSurfaceOnSurfaceLv1
        
        awayTeamLabel.textAlignment = .left
        awayTeamLabel.font = UIFont.body
        awayTeamLabel.numberOfLines = 1
        awayTeamLabel.textColor = UIColor.onSurfaceOnSurfaceLv1
        
        homeScoreLabel.textAlignment = .right
        homeScoreLabel.font = UIFont.body
        homeScoreLabel.textColor = UIColor.onSurfaceOnSurfaceLv1

        awayScoreLabel.textAlignment = .right
        awayScoreLabel.font = UIFont.body
        awayScoreLabel.textColor = UIColor.onSurfaceOnSurfaceLv1
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(4)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(4)
            make.left.equalTo(self).offset(4)
            make.bottom.lessThanOrEqualTo(self).inset(10)
            make.width.equalTo(56)
            make.height.equalTo(16)
        }
        
        verticalDivider.snp.makeConstraints { make in
            make.left.equalTo(self).offset(64)
            make.top.equalTo(self).offset(8)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        homeTeamImage.snp.makeConstraints() { make in
            make.left.equalTo(verticalDivider.snp.right).offset(16)
            make.top.equalTo(self).offset(10)
            make.width.height.equalTo(16)
        }
        
        awayTeamImage.snp.makeConstraints() { make in
            make.left.equalTo(verticalDivider.snp.right).offset(16)
            make.top.equalTo(homeTeamImage.snp.bottom).offset(4)
            make.width.height.equalTo(16)
        }
        
        homeTeamLabel.snp.makeConstraints() { make in
            make.left.equalTo(homeTeamImage.snp.right).offset(8)
            make.top.equalTo(self).offset(10)
            make.width.equalTo(192)
        }
        
        awayTeamLabel.snp.makeConstraints() { make in
            make.left.equalTo(awayTeamImage.snp.right).offset(8)
            make.top.equalTo(homeTeamImage.snp.bottom).offset(4)
            make.width.equalTo(192)
        }
        
        homeScoreLabel.snp.makeConstraints() { make in
            make.top.equalTo(self).offset(10)
            make.right.equalTo(self).inset(16)
            make.width.equalTo(32)
        }
        
        awayScoreLabel.snp.makeConstraints() { make in
            make.top.equalTo(homeScoreLabel.snp.bottom).offset(4)
            make.right.equalTo(self).inset(16)
            make.width.equalTo(32)
        }
    }
    
    func configure(with viewModel: EventViewModel) {
        timeLabel.text = viewModel.startTime
        statusLabel.text = viewModel.matchStatusText
        homeTeamImage.image = viewModel.homeTeamImage
        awayTeamImage.image = viewModel.awayTeamImage
        homeTeamLabel.text = viewModel.homeTeam
        awayTeamLabel.text = viewModel.awayTeam
        homeScoreLabel.text = viewModel.homeScore
        awayScoreLabel.text = viewModel.awayScore
        
        switch viewModel.eventStatus {
            case .inProgress:
                statusLabel.textColor = .specificLive
                homeScoreLabel.textColor = .specificLive
                awayScoreLabel.textColor = .specificLive
            case .finished:
                let homeScore = Int(viewModel.homeScore) ?? 0
                let awayScore = Int(viewModel.awayScore) ?? 0
                
                if homeScore > awayScore {
                    awayTeamLabel.textColor = .onSurfaceOnSurfaceLv2
                    awayScoreLabel.textColor = .onSurfaceOnSurfaceLv2
                } else if homeScore < awayScore {
                    homeTeamLabel.textColor = .onSurfaceOnSurfaceLv2
                    homeScoreLabel.textColor = .onSurfaceOnSurfaceLv2
                } else {
                    homeTeamLabel.textColor = .onSurfaceOnSurfaceLv2
                    awayTeamLabel.textColor = .onSurfaceOnSurfaceLv2
                    homeScoreLabel.textColor = .onSurfaceOnSurfaceLv2
                    awayScoreLabel.textColor = .onSurfaceOnSurfaceLv2
                }
            default:
                statusLabel.textColor = UIColor.onSurfaceOnSurfaceLv2
            }
    }
}

