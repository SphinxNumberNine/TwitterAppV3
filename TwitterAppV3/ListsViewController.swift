//
//  ListsViewController.swift
//  TwitterAppV3
//
//  Created by Chirag on 4/26/17.
//  Copyright © 2017 Chitra Ramaswamy. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var listsTable: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return globalNumberOfLists
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let listCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListsTableViewCell
        
        listCell.listName.text = globalNames[indexPath.row]
        listCell.memberNumber.text = globalNumberOfMembers[indexPath.row]
        listCell.pubOrPrivate.text = globalPublicOrPrivate[indexPath.row]

        
        return listCell
    }

    
    let numOfLists = globalNumberOfLists
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
