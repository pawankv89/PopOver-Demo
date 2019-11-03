//
//  ColorPickerListCell.swift
//  PopOver Demo
//
//  Created by Pawan kumar on 31/10/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ColorPickerListCell: UITableViewCell {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
