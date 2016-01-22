//
//  MeHeaderCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class MeHeaderCell: MeBaseCell {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if detailTextLabel?.text != nil {
            
            DEBUGLOG("")
            imageView?.frame.size.width =  (imageView?.frame.size.width)! * 0.6
            imageView?.frame.size.height =  (imageView?.frame.size.height)! * 0.6
            imageView?.center = CGPointMake(contentView.center.y, contentView.center.y)
        }
    }
}
