//
//  ClubListCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class ClubListCell: UITableViewCell {

    
    var clubListModel: ClubListModel!{
        
        didSet{
            
            
            photoImageView?.yy_imageURL = NSURL(string: clubListModel!.path!)
            
            nameLabel?.text = clubListModel!.name
            
            member_countLabel?.text = "成员 " + "\(clubListModel!.member_count)"
            
            
        }
    }
    
    @IBOutlet weak var member_countLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
