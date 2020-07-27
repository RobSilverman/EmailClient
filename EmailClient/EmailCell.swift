//
//  EmailCell.swift
//  EmailClient
//
//  Created by Robert Silverman on 7/27/20.
//  Copyright © 2020 Robert Silverman. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {
    
    @IBOutlet var emailImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var starredImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
