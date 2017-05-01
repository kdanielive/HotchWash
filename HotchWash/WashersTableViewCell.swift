//
//  WashersTableViewCell.swift
//  HotchWash
//
//  Created by Daniel Kim on 4/20/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit

class WashersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var availability: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /*
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    */
}
