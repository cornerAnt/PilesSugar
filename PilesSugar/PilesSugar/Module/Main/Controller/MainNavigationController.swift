//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController ,UIGestureRecognizerDelegate{
    
    // MARK: - 生命周期
    
    override class func initialize(){
        
        // 设置背景
        let bar = UINavigationBar.appearance()
    
////        bar.setBackgroundImage( UIImage(named:"bar" ), forBarMetrics: UIBarMetrics.me)
//        bar.shadowImage = UIImage(named: "navigationbar_background")
//        
        // 设置文字
        let barAttrs = [NSForegroundColorAttributeName : UIColor.blackColor() ,
            NSFontAttributeName : UIFont.systemFontOfSize(17)]
        
        bar.titleTextAttributes = barAttrs
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        self.interactivePopGestureRecognizer?.delegate = self;

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    /**
//     状态栏
//     
//     */
//    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }
    
    /**
     统一设置返回按钮
     
     */
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count >= 1 {
            
            let backButton = UIButton(type: UIButtonType.Custom)
            backButton.setImage( UIImage(named: "icon_back_dark"), forState: UIControlState.Normal)

            backButton.sizeToFit()
            backButton.addTarget(self, action: Selector("back"), forControlEvents: UIControlEvents.TouchUpInside)
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back() {
        popViewControllerAnimated(true)
        
        
    }
    
    // MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return childViewControllers.count > 1;
    }

    

}


