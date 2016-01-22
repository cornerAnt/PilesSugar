//
//  HomeHotCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/12.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import Kingfisher
class HomeHotCell: UICollectionViewCell {

    
 
    
    @IBOutlet weak private var photoImageView: UIImageView!
    
    @IBOutlet weak private var msgLabel: UILabel!
    
    
    @IBOutlet weak private var reply_countButton: UIButton!
    
    @IBOutlet weak private var favorite_countButton: UIButton!
    
    @IBOutlet weak private var like_countButton: UIButton!
    
    
    @IBOutlet weak private var avatarImageView: UIImageView!
    
    @IBOutlet weak private var nameLabel: UILabel!
    
    @IBOutlet weak private var usernameLabel: UILabel!
    
    
    var homeHotModel : HomeHotModel!{
        didSet{
            
            photoImageView.yy_imageURL = NSURL(string: homeHotModel.path)
            
            msgLabel.text = homeHotModel.msg
            
       
            
            
            // 评论部分
            
            reply_countButton.setTitle("\(homeHotModel.reply_count)", forState: UIControlState.Normal)
            
            favorite_countButton.setTitle("\(homeHotModel.favorite_count)", forState: UIControlState.Normal)
            
            like_countButton.setTitle("\(homeHotModel.like_count)", forState: UIControlState.Normal)
            avatarImageView.yy_imageURL = NSURL(string: homeHotModel.avatar)
        
            avatarImageView.image?.yy_imageByRoundCornerRadius(30)
            nameLabel.text = homeHotModel.name
            
            usernameLabel.text = "by " + homeHotModel.username
    
     
            
        
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

 

}
