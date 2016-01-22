//
//  ClubClubCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/21.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class ClubClubCell: UITableViewCell {
    
    var clubClubModel: ClubClubModel?{
        didSet{
            
            photoImageView?.yy_imageURL = NSURL(string: clubClubModel!.path!)
            
            nameLabel?.text = clubClubModel!.name
            
            unreadLabel?.text = "\(clubClubModel!.topic_unread)"
        }
    }
    
    @IBOutlet weak  var photoImageView: UIImageView!
    
    @IBOutlet weak  var nameLabel: UILabel!
    
    @IBOutlet weak  var unreadLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
    
    
}
