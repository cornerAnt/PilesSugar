//
//  ClubTopicModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SwiftyJSON


class ClubTopicModel: NSObject {
    
    var id: Int!
    
    var content: String!
    
    var like_count: Int!
    var reply_count: Int!
    var add_datetime_ts: Int!

    var sender: Sender!
    
    var replies: Replies!
    

    override init() {
   
    }
    
    class func loadClubTopicModels(data:NSData) -> [ClubTopicModel]{
        
        let json = JSON(data: data)
        
        
        var clubTopicModels = [ClubTopicModel]()
        
        for (_,subJson):(String, JSON) in json["data"]["object_list"]{
            
            let clubTopicModel = ClubTopicModel()
            
    
            
            clubTopicModel.id = subJson["id"].intValue
            clubTopicModel.content = subJson["content"].stringValue
            clubTopicModel.like_count = subJson["like_count"].intValue
            clubTopicModel.reply_count = subJson["reply_count"].intValue
            clubTopicModel.add_datetime_ts = subJson["add_datetime_ts"].intValue

            
    
            
            clubTopicModel.sender = Sender()
            
            clubTopicModel.sender.username = subJson["sender"]["username"].stringValue
        
            
            clubTopicModel.sender.avatar = subJson["sender"]["avatar"].stringValue

            
            
            
            // 回复
           
            clubTopicModel.replies = Replies()
             clubTopicModel.replies.sender = Sender()
            
            clubTopicModel.replies.content = subJson["replies"][0]["content"].stringValue
            
            clubTopicModel.replies.sender.username = subJson["replies"][0]["sender"]["username"].stringValue

            clubTopicModel.replies.sender.avatar = subJson["replies"][0]["sender"]["avatar"].stringValue
            
            clubTopicModels.append(clubTopicModel)
            
            
        }
        
        return clubTopicModels
    }

  
}

class Sender: NSObject {
    
    
    var username: String!
    var avatar: String!
    

    
}

class Replies: NSObject {
    
    
    
    var sender: Sender!
    var content: String!


   
    
}


