//
//  FeedCell.swift
//  MyWorldCup
//
//  Created by Lisa Steele on 4/2/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
//    var teams: [Clubs] = {
//        var one = Clubs()
//        one.name = "Liverpool"
//        one.code = "LIV"
//
//        var two = Clubs()
//        two.name = "Everton"
//        two.code = "EVE"
//
//        return [one, two]
//    }()
    
    let cellId = "cellId"
    var plClubs = [Clubs]()
    
    func fetchData() {
        let jsonURLString = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/en.1.clubs.json"
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error)
            in
            if error != nil {
                print (error)
                return
            }
            guard let data = data else { return }
            
            do {
                let eplResults = try JSONDecoder().decode(EPL.self, from: data)
                for item in eplResults.clubs {
                    let club = item.name
                    self.plClubs.append(club)
                    //print (item.name)
                }
                    
                    //self.collectionView.reloadData()

//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//                var results = [Clubs]()
//
//                for dictionary in json as! [String: AnyObject] {
//                    let leagueName = Clubs()
//                    leagueName.name = dictionary["name"] as? String
//
//                    let clubs = dictionary["clubs"]
//                    print (clubs)
//
////                    let clubName = Clubs()
////                    clubName.name = dictionary["name"] as? String
//
////                    results.append(clubName)
////                    print (results)
            } catch let jsonError {
                print (jsonError)
            }
        }) .resume()

    }
    
    override func setupViews() {
        super.setupViews()
        fetchData()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(GroupsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 2
        //return teams.count
        return plClubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GroupsCell
        cell.epl = plClubs[indexPath.item]
//        cell.epl = teams[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: frame.width, height: 295)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
    
}
