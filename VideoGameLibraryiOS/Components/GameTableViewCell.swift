//
//  GameTableViewCell.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/16/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
