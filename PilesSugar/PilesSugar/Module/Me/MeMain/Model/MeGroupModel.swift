//
//  MeGroupModel.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class MeGroupModel: NSObject {
    
    ///  组头文字
    var headerTitle: String?
    ///  组尾文字
    var footerTitle: String?
    ///  模型数组
    var items = [MeItemModel]()
    
    convenience init(headerTitle: String, footerTitle: String) {
        self.init()
        
        self.headerTitle = headerTitle;
        self.footerTitle = footerTitle;
    }
    
    convenience init(items: [MeItemModel]) {
        self.init()
        self.items = items;
        
    }
}
