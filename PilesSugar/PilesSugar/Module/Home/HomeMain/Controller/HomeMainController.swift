//
//  HomeMainController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/13.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class HomeMainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavgation()
        setupSegmentedControl()
        
    }
    private func setupNavgation() {
        
        addChildViewController(HomeHotController())
        
        addChildViewController(TestViewController())
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "话题", titleColor: UIColor.grayColor(), target: self, action: Selector("leftBarButtonClick"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "nav_icon_add_red", titleName: "", target: self,action: Selector("rightBarButtonClick"))
    }
    
    private func setupSegmentedControl() {
        
        let segmentedArray = ["热门","关注动态"]
        
        let segmentedControl =  UISegmentedControl(items: segmentedArray)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.tintColor = UIColor.tintColor()
        
        segmentedControl.addTarget(self, action: Selector("segmentedControlChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
        navigationItem.titleView = segmentedControl
        
        segmentedControlChange(segmentedControl)
        
    }
    
    // MARK: - 事件
    
    @objc private func segmentedControlChange(segmentedControl:UISegmentedControl) {
        
        let vc = childViewControllers[segmentedControl.selectedSegmentIndex]
        
        vc.view.frame = view.bounds
        
        view.addSubview(vc.view)
    }
    @objc private func rightBarButtonClick(){
        
       
     navigationController?.presentViewController(HomeAddController(), animated: true, completion: nil)
    }
    
    @objc private func leftBarButtonClick(){
        
        
        navigationController?.presentViewController(TestViewController(), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
