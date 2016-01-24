//
//  ClubHotModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/13.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON
private let comment_countWidth : CGFloat = 25.0
private let avatarWidth : CGFloat = 100.0

class ClubHotModel: NSObject {
    
    var id :Int!
    
    var path: String!
    
    var comment_count:Int!
     var visit_count:Int!
    
    var content:String!

    var avatar:String!
    
    var name:String!
    var username:String!

    var active_time:Int!
    var add_datetime_ts:Int!
    
    
   
    
    // 最终cell的高度
    var modelHeight:CGFloat!{
        
        var finalHeight: CGFloat = kCommenMargin
        
        // 1.计算文章高度
        let contentWidth = kMainScreenW - comment_countWidth - 5 * kCommenMargin
        
        let contentHeight = content!.getTextRectSize(UIFont.systemFontOfSize(10), size: CGSize(width: contentWidth, height: 300)).height
                
        finalHeight += contentHeight + kCommenMargin
        
        // 2.计算图片高度
        if path.isEmpty {
            finalHeight +=  kCommenMargin
        }else{
            finalHeight += avatarWidth + kCommenMargin
        }
        // 3.计算用户信息高度
        let userInfoHeight =  name!.getTextRectSize(UIFont.systemFontOfSize(9), size: CGSize(width: contentWidth, height: 200)).height
        
        finalHeight += kCommenMargin + userInfoHeight
        
        return finalHeight
        
    }

//
//    override init() {
//        super.init()
//        
//        comment_count = 0
//        content = ""
//        avatar = ""
//        name   = ""
//        username = ""
//        active_time = 0
//        add_datetime_ts = 0
//        path = ""
//        
//        
//    }
    
    class func loadCulbHotModels(data:NSData) -> [ClubHotModel]{
        
        let json = JSON(data: data)
        
        
        var clubHotModels = [ClubHotModel]()
        
        for (_,subJson):(String, JSON) in json["data"]["object_list"]{
            
            let clubHotModel = ClubHotModel()
            
            clubHotModel.id = subJson["id"].intValue
            clubHotModel.path = subJson["photos"][0]["path"].stringValue
        
            
            clubHotModel.comment_count = subJson["comment_count"].intValue
            clubHotModel.visit_count = subJson["visit_count"].intValue
            clubHotModel.active_time = subJson["active_time"].intValue
            clubHotModel.add_datetime_ts = subJson["add_datetime_ts"].intValue
            
            
            clubHotModel.name = subJson["club"]["name"].stringValue
            
            clubHotModel.content = subJson["content"].stringValue
            clubHotModel.avatar = subJson["sender"]["avatar"].stringValue
            
            
            clubHotModel.username = subJson["sender"]["username"].stringValue
            
            clubHotModels.append(clubHotModel)
            
        }
        
        return clubHotModels
    }
    
    //    "id": 117792,
    //    "content": "讲一个暗恋的故事吧！ 我先来",
    //    "category": "default",
    //    "sender": {
    //				"id": 10267604,
    //				"username": "萧潇肖筱",
    //				"avatar": "http://cdn.duitang.com/uploads/people/201512/20/20151220213752_SCyNG.jpeg"
    //    },
    //    "photos": [{
    //				"width": 1200,
    //				"height": 2133,
    //				"path": "http://img5.duitang.com/uploads/item/201510/06/20151006183742_NrM8Y.jpeg"
    //    }],
    //    "tags": [{
    //				"id": 89567,
    //				"name": "精选",
    //				"relation_type": 2
    //    }],
    //    "comment_count": 1542,
    //    "visit_count": 0,
    //    "active_time": 1452652967,
    //    "add_datetime_ts": 1444127862,
    //    "club": {
    //				"id": "54aa79de17c2196560f068a4",
    //				"name": "暗恋互助会"
    //    }
}
