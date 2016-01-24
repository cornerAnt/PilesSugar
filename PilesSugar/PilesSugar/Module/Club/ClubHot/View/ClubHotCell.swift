//
//  ClubHotCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/13.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class ClubHotCell: UITableViewCell {

    /*
    comment_count = 0
    content = ""
    avatar = ""
    name   = ""
    username = ""
    active_time = 0
    add_datetime_ts = 0
    
    */
    
    var clubHotModel : ClubHotModel!{
        didSet{
           
            var count = clubHotModel.comment_count!
            var tempStr = ""
            if count > 999 {
                 count =  count / 1000
                 tempStr = "\(count)" + "k"
            }else{
                tempStr = "\(count)"
            }
            

            comment_countButton.setTitle(tempStr , forState: UIControlState.Normal)
        
            photoImageView.yy_imageURL = NSURL(string: clubHotModel.path!)
           
            contentLabel.text = clubHotModel.content
            userInfoLabel.text = clubHotModel.name! + " - " + clubHotModel.username!
            
          
         }
    }
    
    @IBOutlet weak private var comment_countButton: UIButton!
    
    
    @IBOutlet weak private var photoImageView: UIImageView!
    @IBOutlet weak private var contentLabel: UILabel!
    
    @IBOutlet weak private var userInfoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
