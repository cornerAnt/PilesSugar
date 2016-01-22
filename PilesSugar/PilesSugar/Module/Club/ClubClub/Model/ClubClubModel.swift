//
//  ClubClubModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/21.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON

class ClubClubModel: NSObject {
    

    
    var path: String?
    
    var name:String?
    
    var topic_unread :Int!
    
    override init() {
        super.init()
        
        path = ""

        name   = ""
        
        topic_unread = 0
        
        
    }
    
    class func loadClubClubModels(data:NSData) -> [ClubClubModel]{
        
        let json = JSON(data: data)
        
        
        var clubClubModels = [ClubClubModel]()
        
        for (_,subJson):(String, JSON) in json["data"]["object_list"]{
            
            let clubClubModel = ClubClubModel()
         
            
            clubClubModel.name = subJson["name"].stringValue
            
            clubClubModel.path = subJson["photo"]["path"].stringValue
            
            clubClubModel.topic_unread = subJson["topic_unread"].intValue

            clubClubModels.append(clubClubModel)
            
        }
        
        return clubClubModels
    }
}
/*
"tags": [
"生活"
],
"id": "54b790b117c2cc03d7c43b8e",
"member_count": 100418,
"name": "健身减肥帮",
"check_in": {
"has_check": 0,
"all_count": 0,
"continuous": 0
},
"topic_unread": 0,
"update_count": 0,
"photo": {
"path": "http://img4.duitang.com/uploads/files/201501/15/20150115152731_mejXM.jpeg"
}
*/