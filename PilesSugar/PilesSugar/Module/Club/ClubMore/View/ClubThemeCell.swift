//
//  ClubThemeCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class ClubThemeCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        titleLabel.highlighted = selected
        indicatorView.hidden = !selected
        
    }
}
