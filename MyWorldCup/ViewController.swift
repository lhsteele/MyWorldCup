//
//  ViewController.swift
//  MyWorldCup
//
//  Created by Lisa Steele on 3/13/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

struct EPL : Decodable {
    let name : String
    let clubs : [Clubs]
    
    enum CodingKeys: String, CodingKey {
        case name, clubs
    }
    
    struct Clubs: Decodable {
        let name : String
        let code : String
        
        enum CodingKeys: String, CodingKey {
            case name, code
        }
    }
}

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

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(GroupsCell.self, forCellWithReuseIdentifier: "cellId")
        //The menubar is 50px high
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupNavBarButtons()
        fetchData()
    }
    
    func fetchData() {
        let jsonURLString = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/en.1.clubs.json"
        
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error)
            in
            if error != nil {
                print (error)
                return
            }
            guard let data = data else { return }
            
            do {
                let eplResults = try JSONDecoder().decode(EPL.self, from: data)
                for item in eplResults.clubs {
                    print (item.name)
                }
                
                //self.collectionView?.reloadData()
            } catch let jsonError {
                print (jsonError)
            }
        } .resume()
        
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let listButton = UIBarButtonItem(image: UIImage(named: "list"), style: .plain, target: self, action: #selector(handleMore))
        searchBarButtonItem.tintColor = UIColor.white
        listButton.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItems = [listButton, searchBarButtonItem]
    }
    
    @objc func handleSearch() {
        print (123)
    }
    
    //lazy var means this block of code only gets called if the settingsLauncher var is nil. Once it gets called and it's not nil, then it won't get called again. 
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore() {
        settingsLauncher.showSettings()
    }
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsVC = UIViewController()
        dummySettingsVC.view.backgroundColor = UIColor.white
        dummySettingsVC.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = UIColor.white
        //This is how to change the color of the text in the navbar
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.pushViewController(dummySettingsVC, animated: true)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 295)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class GroupsCell: BaseCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let groupName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.backgroundColor = UIColor.gray
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        return label
    }()
    
    let team1: UILabel = {
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
        addSubview(groupName)
        addSubview(team1)
        addSubview(team2)
        addSubview(team3)
        addSubview(team4)
        addSubview(separatorView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: groupName)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team1)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team2)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team3)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: team4)
        addConstraintsWithFormat(format: "V:|-16-[v0(30)]-8-[v1(50)]-8-[v2(50)]-8-[v3(50)]-8-[v4(50)]-16-[v5(1)]|", views: groupName, team1, team2, team3, team4, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//this extension allows us to simplify the code above for setting constraints.
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

