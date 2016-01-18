//
//  UrlTableViewCell.swift
//  Gymglish
//
//  Created by Ronaël Bajazet on 18/01/2016.
//  Copyright © 2016 Gymglish. All rights reserved.
//

import UIKit

class UrlTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
