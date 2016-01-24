//
//  ClubTopicHeaderCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/23.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class ClubTopicHeaderCell: UITableViewCell {

    
    var clubHotModel: ClubHotModel!{
        didSet{
            tagsLabel.text = "精选"
            photoImageView.yy_imageURL = NSURL(string: clubHotModel.path!)
            contentLabel.text = clubHotModel.content
            usernameLabel.text = clubHotModel.username
            
            datetimeLabel.text = "\(clubHotModel.add_datetime_ts)"
            visit_countLabel.text = "\(clubHotModel.visit_count)"
            
        }
    }
    
    
    
   
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var datetimeLabel: UILabel!
    @IBOutlet weak var visit_countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
