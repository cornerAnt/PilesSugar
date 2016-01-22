//
//  MeItemModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

enum ItemType{
    
    case Switch
    
    case Defult
    
}

class MeItemModel: NSObject {
    
    typealias itemTargetClosure = (indexPath: NSIndexPath) -> ()
    
    typealias targetViewControllerClosure = () -> UIViewController

    
    var image: UIImage?
    var title: String?
    var subtitle: String?
    var type : ItemType = ItemType.Defult

    
    // cell对应的功能
    var itemTarget : itemTargetClosure?
    // 跳转对应的控制器
    var targetViewController :  targetViewControllerClosure?
    
    convenience init(image: UIImage,title: String, subtitle: String) {
        self.init()
        
        self.image = image;
        self.title = title;
        self.subtitle = subtitle;
    }
    convenience init(image: UIImage?,title: String) {
        self.init()
        
        self.image = image;
        self.title = title;
        
        
    }
    
    func setTarget(targetClosure : itemTargetClosure){
        self.itemTarget = targetClosure
    }
    func setTargetVc(targetVcClosure : targetViewControllerClosure){
        
        self.targetViewController = targetVcClosure
    }
    
 
}