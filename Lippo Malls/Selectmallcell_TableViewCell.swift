//
//  Selectmallcell_TableViewCell.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/5/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import UIKit

class Selectmallcell_TableViewCell: UITableViewCell {

    @IBOutlet weak var mallicon: UIImageView!
    @IBOutlet weak var mallname: UILabel!
    
    @IBOutlet weak var mallName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mallicon.layer.cornerRadius = self.mallicon.frame.size.width/2
        self.mallicon.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
