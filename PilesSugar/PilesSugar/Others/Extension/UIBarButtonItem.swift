//
//  UIBarButtonItem.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    /**
     创建一个UIBarButtonItem(有图片)
     */
    convenience init(imageName: String,titleName: String, target: AnyObject?, action: Selector){
        
        let button = UIButton(type: UIButtonType.Custom)
        button.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Highlighted)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.sizeToFit()
        self.init(customView: button)
    }
    /**
     创建一个UIBarButtonItem(无图片)
     */
    convenience init(title: String,titleColor: UIColor, target: AnyObject?, action: Selector){
        
        let button = UIButton(type: UIButtonType.Custom)
        
        button.setTitle(title, forState: UIControlState.Normal)
        
        button.setTitleColor(titleColor, forState: UIControlState.Normal)
        
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.sizeToFit()

        self.init(customView: button)
    }
}

