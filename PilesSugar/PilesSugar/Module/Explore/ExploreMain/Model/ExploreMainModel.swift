//
//  ExploreMainModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON

class ExploreMainModel: NSObject {
    
    var group_id: String!
    var content_type: String!
    var group_name: String!
    var group_items: [Group_item]!
    
    
    
    class func loadExploreMainModels(data:NSData) -> [ExploreMainModel]{
        
        let json = JSON(data: data)
        
        
        var exploreMainModels = [ExploreMainModel]()
        
        for (_,subJson):(String, JSON) in json["data"]{
            
            let exploreMainModel = ExploreMainModel()
            
            
            
            exploreMainModel.group_id = subJson["group_id"].stringValue
            exploreMainModel.content_type = subJson["content_type"].stringValue
            exploreMainModel.group_name = subJson["group_name"].stringValue
            
            exploreMainModel.group_items = [Group_item]()
            
            for (_,subSubJson):(String, JSON) in subJson["group_items"]{
                
                let group_item = Group_item()
                
                
                group_item.name = subSubJson["name"].stringValue
                
                group_item.icon_url = subSubJson["icon_url"].stringValue
                
                group_item.target = subSubJson["target"].stringValue

                exploreMainModel.group_items.append(group_item)
            }
            
            exploreMainModels.append(exploreMainModel)
            
           
        }
        
        return exploreMainModels
    }

}

class Group_item: NSObject {
    
    
    var name: String!
    var icon_url: String!
    var target: String!

    
}

