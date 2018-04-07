//
//  GroupsCell.swift
//  MyWorldCup
//
//  Created by Lisa Steele on 4/4/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    
}

class GroupsCell: BaseCell {

//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            //setupViews()
//        }
    
        var clubList: EPL? {
            didSet {
                clubName.text = clubList?.name
            }
        }
        
        var leagueName: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Premier League"
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.backgroundColor = UIColor.gray
            label.layer.cornerRadius = 15
            label.clipsToBounds = true
            return label
        }()
        
        let clubName: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Egypt"
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.backgroundColor = UIColor.orange
            label.layer.cornerRadius = 15
            label.clipsToBounds = true
            return label
        }()
        
        let team2: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Russia"
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.backgroundColor = UIColor.orange
            label.layer.cornerRadius = 15
            label.clipsToBounds = true
            return label
        }()
        
        let team3: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Saudi Arabia"
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.backgroundColor = UIColor.orange
            label.layer.cornerRadius = 15
            label.clipsToBounds = true
            return label
        }()
        
        let team4: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Uruguay"
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.backgroundColor = UIColor.orange
            label.layer.cornerRadius = 15
            label.clipsToBounds = true
            return label
        }()
        
        //This is to put the line in between cells, take out later.
        let separatorView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.black
            return view
        }()
        
        override func setupViews() {
            addSubview(leagueName)
            addSubview(clubName)
            addSubview(team2)
            addSubview(team3)
            addSubview(team4)
            addSubview(separatorView)
            
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: leagueName)
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: clubName)
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team2)
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team3)
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team4)
            addConstraintsWithFormat(format: "V:|-16-[v0(30)]-8-[v1(50)]-8-[v2(50)]-8-[v3(50)]-8-[v4(50)]-16-[v5(1)]|", views: leagueName, clubName, team2, team3, team4, separatorView)
            addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        }

}
