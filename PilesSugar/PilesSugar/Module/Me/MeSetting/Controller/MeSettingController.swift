//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class MeSettingController: MeMainBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAllGroups()
        
        tableView.tableFooterView = footerBtn
        tableView.contentInset.top = -25
        title = "设置"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    private func setupAllGroups(){
        
        setupGroupOne()
        setupGroupTwo()
        setupGroupThree()
    }
 
    private func setupGroupOne(){
        
        let item0 = MeItemModel(image: nil, title: "帐号与安全")
        
        let group = MeGroupModel(items: [item0])
        
        groups.append(group)
        
    }
    private func setupGroupTwo(){
        
        let item0 = MeItemModel(image: nil, title: "清除图片缓存")
        
        let group = MeGroupModel(items: [item0])
        
        groups.append(group)
        
    }
    private func setupGroupThree(){
        
        let item0 = MeItemModel(image: nil, title: "意见反馈")
        let item1 = MeItemModel(image: nil, title: "去App Store给我们评五星")
        let item2 = MeItemModel(image: nil, title: "关于我们")
        let group = MeGroupModel(items: [item0,item1,item2])
        
        groups.append(group)
        
    }
    
 // MARK: - 懒加载
    private lazy var footerBtn : UIButton = {
        
        let button = UIButton(type: UIButtonType.Custom)
        
        button.setTitle("退出登录", forState: UIControlState.Normal)
        
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("footerButtonClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        button.sizeToFit()
        
        return button
        
    }()
    
 // MARK: - 事件
    
    @objc private func footerButtonClick(){
        
        DEBUGLOG("退出登录")
   
    }
}
