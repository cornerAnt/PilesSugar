//
//  HomeHotModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/12.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON

private let userIconW : CGFloat = 40.0
private let commentH : CGFloat = 25
class HomeHotModel: NSObject {
    
  
     var columnWidth: CGFloat = 0

    // photo
    /// 图片
    var path : String!
    var height : NSNumber!
    var width : NSNumber!
    
    //
    var reply_count : NSNumber!
    var like_count : NSNumber!
    var favorite_count : NSNumber!
    
    /// 用户头像
    var avatar : String!
    var msg : String!
    var username : String!
    
    var name : String!

    // 模型的高度
    var modelHeight: CGFloat?{
        
       
        
        var finnalHeight :CGFloat = 0.0
         // 1.计算图片的高度
      
        // 先写死
        let phohoHeight = CGFloat(height.doubleValue / width.doubleValue) * columnWidth
        
        finnalHeight += phohoHeight + kSmallCommenMargin
        // 2.计算描述文字
        let msgWidth = columnWidth - kCommenMargin * 2
        let msgHeight = msg.getTextRectSize(UIFont.systemFontOfSize(10), size: CGSize(width: msgWidth, height: 50)).height
        
        finnalHeight += msgHeight 
        
        // 3.计算评论的高度
        finnalHeight += commentH + kCommenMargin
        
        // 4.计算用户名称的高度
        let nameWidth = columnWidth - kCommenMargin * 3 - userIconW
        let nameHeight = name.getTextRectSize(UIFont.systemFontOfSize(10), size: CGSize(width: nameWidth, height: 50)).height
        
        let userNameHeight = username.getTextRectSize(UIFont.systemFontOfSize(9), size: CGSize(width: nameWidth, height: 50)).height
        
        finnalHeight += nameHeight + kCommenMargin + userNameHeight + kCommenMargin
        

        
        return finnalHeight
    }
   
    
    class func loadHomeModels(data:NSData) -> [HomeHotModel]{
        
        let json = JSON(data: data)
        
        
        var hotModels = [HomeHotModel]()
        
        for (_,subJson):(String, JSON) in json["data"]["object_list"]{
            
            let homeHot = HomeHotModel()
            
            
            
            homeHot.path = subJson["photo"]["path"].stringValue
            homeHot.height = subJson["photo"]["height"].doubleValue
            homeHot.width = subJson["photo"]["width"].doubleValue
            
            homeHot.reply_count = subJson["reply_count"].doubleValue
            homeHot.like_count = subJson["like_count"].doubleValue
            homeHot.favorite_count = subJson["favorite_count"].doubleValue

            homeHot.avatar = subJson["sender"]["avatar"].stringValue
            homeHot.username = subJson["sender"]["username"].stringValue
            homeHot.msg = subJson["msg"].stringValue
            
            homeHot.name = subJson["album"]["name"].stringValue

            hotModels.append(homeHot)
            
         }
        
        return hotModels
    }
    
    
    var properties = ["path", "height", "width","reply_count", "like_count", "favorite_count","avatar", "username", "msg", "name"]
    override var description: String {
        
        let dict = dictionaryWithValuesForKeys(properties)
        return "\(dict)"
    }
/*
    "album": {
    "id": 76502468,
    "name": "你的眼睛美如星辰"
    },
    "photo": {
    "path": "http://img5.duitang.com/uploads/item/201601/10/20160110235044_LBHWU.jpeg_webp",
    "height": 578,
    "width": 385
    },
    "add_datetime": "昨天 23:50",
    "like_count": 2,
    "add_datetime_pretty": "11小时前",
    "reply_count": 0,
    "sender": {
    "username": "我最近没胖",
    "avatar": "http://img5.duitang.com/uploads/blog/201411/13/20141113211634_kGrX2.jpeg",
    "id": 4521024
    },
    "add_datetime_ts": 1452441044,
    "icon_url": "",
    "favorite_count": 13,
    "sender_id": 4521024,
    "id": 511350387,
    "msg": "你的眼睛美如星辰",
    "extra_type": "PICTURE"
    },
    */

    
  
}

