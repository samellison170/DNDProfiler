//
//  ProfileTableViewCell.swift
//  DNDprofiler
//
//  Created by Sam on 12/6/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileIcon: UIImageView!
    @IBOutlet weak var CharacterNameLabel: UILabel!
    @IBOutlet weak var LevelLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
