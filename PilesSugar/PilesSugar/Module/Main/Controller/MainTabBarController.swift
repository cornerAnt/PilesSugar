//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    // MARK: - 生命周期方法
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        addAllVcs()
    
    }
    
    override func loadView() {
        super.loadView()
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - 初始化
    
    private func addAllVcs(){
        
        addOneVc(ClubMainController(), title: "Club", image: "tab_icon_club")
        addOneVc(HomeMainController(), title: "首页", image: "tab_icon_home")
        addOneVc(UIViewController(), title: "发现", image: "tab_icon_explore")
        addOneVc(UIViewController(), title: "商店", image: "tab_icon_store")
        addOneVc(MeMainController(), title: "我", image: "tab_icon_me")
      
        
        tabBar.tintColor = UIColor.tintColor()
        
        
    }
    
    private func addOneVc(childVC:UIViewController, title:String, image:String)  {
        
        childVC.title = title
        
        childVC.tabBarItem.image = UIImage(named: image)
        
        childVC.tabBarItem.selectedImage = UIImage(named: image + "_highlight" )
        
        let nav = MainNavigationController()
        
        nav.addChildViewController(childVC)
        
        addChildViewController(nav)
    }
    
    
    
}
