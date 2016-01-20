//
//  MallCell_TableViewCell.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/2/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import UIKit

class MallCell_TableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var mallIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mallIcon.layer.cornerRadius = self.mallIcon.frame.size.width/2
        self.mallIcon.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
