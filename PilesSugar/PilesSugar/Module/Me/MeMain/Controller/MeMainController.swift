//
//  MeMainController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class MeMainController: MeMainBaseController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        setupAllGroups()
        setupNavgation()
        tableView.contentInset.top = -35
    }
    private func setupNavgation(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "设置", titleColor: UIColor.blueColor(), target: self, action: Selector("rightBarButtonClick"))
    
    }
    
    
   @objc private func rightBarButtonClick(){
        
      navigationController?.pushViewController(MeSettingController(), animated: true)
    }
    
    private func setupAllGroups(){
        
        setupGroupOne()
        setupGroupTwo()
        setupGroupThree()
        setupGroupFour()
        setupGroupFive()

    }
    

    private func setupGroupOne(){
        let item0 = MeItemModel(image: UIImage(named: "test")!.circleImage(), title: "ConerAnt")
         item0.subtitle = "code"
        item0.setTargetVc { () -> UIViewController in
            
            return TestViewController()
        }
    
        let group = MeGroupModel(items: [item0])
        
        groups.append(group)
    
    }
    private func setupGroupTwo(){
        
        let item0 = MeItemModel(image: UIImage(named: "me_icon_order")!, title: "我的订单")
     
        let item1 = MeItemModel(image: UIImage(named: "me_icon_coupon")!, title: "我的优惠券")
        
        
        let group = MeGroupModel(items: [item0,item1])
        
        groups.append(group)
        
    }
    
    private func setupGroupThree(){
        
        let item0 = MeItemModel(image: UIImage(named: "me_icon_album")!, title: "我的专辑")
        
        let item1 = MeItemModel(image: UIImage(named: "me_icon_like")!, title: "我喜欢的专辑")
        
        
        let group = MeGroupModel(items: [item0,item1])
        
        groups.append(group)
    }
    
    private func setupGroupFour(){
        
        let item0 = MeItemModel(image: UIImage(named: "me_icon_notification")!, title: "通知")
        let item1 = MeItemModel(image: UIImage(named: "me_icon_comments")!, title: "评论 / 赞")
        let item2 = MeItemModel(image: UIImage(named: "me_icon_message")!, title: "聊天")
        
        let group = MeGroupModel(items: [item0,item1,item2])
        
        groups.append(group)
        
    }
    private func setupGroupFive(){
        
        let item0 = MeItemModel(image: UIImage(named: "me_icon_message")!, title: "我的好友")
        
        let group = MeGroupModel(items: [item0])
        
        groups.append(group)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
      return  indexPath.section == 0 ?  85 :  45
        
    }
 
    
    
}
