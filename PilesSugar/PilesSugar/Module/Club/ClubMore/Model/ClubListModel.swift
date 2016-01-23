//
//  ClubListModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON

class ClubListModel: NSObject {

    
    var path: String?
    
    var name:String?
    
    var member_count :Int!
    
    
    override init() {
        super.init()
        
        path = ""
        
        name   = ""
        
        member_count = 0
        
        
    }
    
    
    class func loadClubListModels(data:NSData) -> [ClubListModel]{
        
        let json = JSON(data: data)
        
        
        var clubListModels = [ClubListModel]()
        
        for (_,subJson):(String, JSON) in json["data"]["object_list"]{
            
            let clubListModel = ClubListModel()
            
            
            clubListModel.name = subJson["name"].stringValue
            
            clubListModel.path = subJson["photo"]["path"].stringValue
            
            clubListModel.member_count = subJson["member_count"].intValue
            
            clubListModels.append(clubListModel)
            
        }
        
        return clubListModels
    }
}
/*
"id": "562dba25257ac474e6bf0182",
"member_count": 3945,
"name": "热缩片",
"photo": {
"path": "http://img4q.duitang.com/uploads/people/201510/29/20151029103154_sPxUX.jpeg"
}
},
*/