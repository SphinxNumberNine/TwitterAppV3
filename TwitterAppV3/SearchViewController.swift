//
//  SearchViewController.swift
//  TwitterAppV3
//
//  Created by Chirag on 5/18/17.
//  Copyright © 2017 Chitra Ramaswamy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listsTableView: UITableView!
    
    var numberOfLists = Int()
    var listNames = [String]()
    var numberofMembers = [String]()
    var publicOrPrivate = [String]()
    
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        listsTableView.delegate = self
        listsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfLists
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.listNames[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
