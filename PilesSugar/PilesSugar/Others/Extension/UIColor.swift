//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
extension UIColor{
    
    class func randomColor() -> UIColor {
        
        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber() , alpha: 1.0)
    }
    
    class func randomNumber() -> CGFloat {
        // 0 ~ 255
        return CGFloat(arc4random_uniform(255)) / CGFloat(255)
    }
    
    class func tintColor() -> UIColor {
        return UIColor(red: 223 / 255.0, green: 52 / 255.0, blue: 46 / 255.0 , alpha: 1.0)
    }

}