//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//


import UIKit
extension UIImage {
    
    /**
     获得对应的圆形图片
     
     - returns: 需要裁剪的图片
     */
    func circleImage() -> UIImage{
        
        // 开启位图上下文
        UIGraphicsBeginImageContext(self.size)
        
        // 获得上下文
        let ctx = UIGraphicsGetCurrentContext()
        
        // 创建矩形框
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        
        CGContextAddEllipseInRect(ctx, rect)
        
        CGContextClip(ctx)
        
        // 向矩形框画圆
        self.drawInRect(rect)
        
        // 获得新的图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
   class func imageWithColor(color: UIColor,rect :CGRect) -> UIImage{
        
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
    
        return image;
    }
    
}