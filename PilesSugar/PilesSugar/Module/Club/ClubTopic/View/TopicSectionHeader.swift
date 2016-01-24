//
//  TopicSectionHeader.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/23.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class TopicSectionHeader: UIView {


    @IBOutlet weak var titleLabel: UILabel!
    class func loadFromXib() -> TopicSectionHeader {
        
     return   NSBundle.mainBundle().loadNibNamed("TopicSectionHeader", owner: self, options: nil).last as! TopicSectionHeader
    }
    
}
