//
//  UIButton.swift
//  YouKu
//
//  Created by SoloKM on 16/1/7.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

func DEBUGLOG<T>(message: T, file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__)
{
    
        print("\(method)[\(line)]: \(message)")
    
}
let kNavgationBarH: CGFloat = 64.0
let kTabBarH: CGFloat = 49.0
let kMainScreenW = UIScreen.mainScreen().bounds.size.width
let kMainScreenH = UIScreen.mainScreen().bounds.size.height
let kCommenMargin :CGFloat = 10.0
let kSmallCommenMargin :CGFloat = 10.0
// conllectionItems
let kThreeItemsWidth = (kMainScreenW - 4.0 * kCommenMargin) / 3.0 - 0.1
let kTwoItemsWidth = (kMainScreenW - 3.0 * kCommenMargin) / 2.0
let kOneItemWidth = kMainScreenW - 2.0 * kCommenMargin

let kThreeItemItemSzie = CGSizeMake(kThreeItemsWidth, kThreeItemsWidth + 3 * kCommenMargin)
let kTwoItemSzie = CGSizeMake(kTwoItemsWidth, kThreeItemItemSzie.height)
let kOneItemSzie = CGSizeMake(kOneItemWidth, kThreeItemItemSzie.height)

