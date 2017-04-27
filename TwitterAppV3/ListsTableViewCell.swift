//
//  ListsTableViewCell.swift
//  TwitterAppV3
//
//  Created by Chirag on 4/26/17.
//  Copyright © 2017 Chitra Ramaswamy. All rights reserved.
//

import UIKit

class ListsTableViewCell: UITableViewCell {

    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var memberNumber: UILabel!
    @IBOutlet weak var pubOrPrivate: UILabel!
  
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
