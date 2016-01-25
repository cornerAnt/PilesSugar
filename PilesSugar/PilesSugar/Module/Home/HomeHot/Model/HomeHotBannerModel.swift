//
//  HomeHotBannerModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeHotBannerModel: NSObject {


    
    var target : String!
    var tag : String!
    var content_type : String!
    var image_url : String!
    var desc : String!

    /*
    
    "target": "duitang://www.duitang.com/album/detail/?id=75212512",
    "tag": "NEW",
    "stitle": "",
    "content_type": "banner",
    "image_url": "http://img4q.duitang.com/uploads/people/201601/13/20160113165623_yXeSj.jpeg",
    "enabled_at": 1453564860,
    "enabled_at_str": "2016-01-24 00:01:00",
    "disabled_at": 1454169600,
    "disabled_at_str": "2016-01-31 00:00:00",
    "description": "使用感记录成册",
    "tag_title": ""
    */
    
    class func loadHomeModels(data:NSData) -> [HomeHotBannerModel]{
        
        let json = JSON(data: data)
        
        
        var bannerModels = [HomeHotBannerModel]()
        
        for (_,subJson):(String, JSON) in json["data"]{
            
            let bannerModel = HomeHotBannerModel()
            

            
            bannerModel.target = subJson["target"].stringValue
            bannerModel.tag = subJson["tag"].stringValue
            bannerModel.content_type = subJson["content_type"].stringValue
            bannerModel.image_url = subJson["image_url"].stringValue
            bannerModel.desc = subJson["description"].stringValue

            bannerModels.append(bannerModel)
            
        }
        
        return bannerModels
    }
    

}
