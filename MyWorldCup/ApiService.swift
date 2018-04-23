//
//  //ApiService.swift
//  //MyWorldCup
//
//  //Created by Lisa Steele on 4/4/18.
//  //Copyright © 2018 lisahsteele. All rights reserved.
//
//
//import UIKit
//
//class ApiService: NSObject {
//    static let sharedInstance = ApiService()
//    
//    func fetchDataForUrlString() {
//        let jsonURLString = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/en.1.clubs.json"
//        guard let url = URL(string: jsonURLString) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error)
//            in
//            if error != nil {
//                print (error)
//                return
//            }
//            guard let data = data else { return }
//            
//            do {
//                //This code works in printing out the team names.
//                
//                
//                let eplResults = try JSONDecoder().decode(EPL.self, from: data)
//                for item in eplResults.clubs {
//                    let club = item.name
//                    var plClub = Clubs(name: club)
//                    self.plClubs.append(plClub)
//                }
//                //print (self.plClubs)
//                
//            } catch let jsonError {
//                print (jsonError)
//            }
//            } .resume()
//    }
//
//}
//
//
