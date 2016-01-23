//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

enum Method: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}
class NetWorkTool: NSObject {
    
   
    typealias successClosure = (response: NSData?)->()
    typealias failureClosure =  (error: NSError?)->()
 
        private static let instance = NetWorkTool()
        class var sharedInstance : NetWorkTool {
         return instance
      
    }
    
    /**
     get请求
     
     */
    func get(   url: String,
        parameters: [String:AnyObject]?,
        success: successClosure,
        failure: failureClosure )
    {
        
   
        
        Alamofire.request(.GET, url, parameters:parameters ).responseData{
            response in
            
            switch response.result {
            case .Success :
//                let json = JSON(data: response.result.value!)

                success(response: response.data)
            case .Failure :
                failure(error: response.result.error)
            }
        }
    }
    
    /**
     post请求
     
     */
    func post(   url: String,
        parameters: [String:AnyObject]?,
        success: successClosure,
        failure: failureClosure )
    {
        
      
        Alamofire.request(.GET, url, parameters:parameters ).responseData{
            response in
            
            switch response.result {
            case .Success :
//                let json = JSON(data: response.result.value!)
                
                
                success(response: response.data)
            case .Failure :
                failure(error: response.result.error)
            }
        }
    }
    
    
    
 
    
    
}