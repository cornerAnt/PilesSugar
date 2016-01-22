//
//  HomeAddController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/13.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class HomeAddController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeBtnClick(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }


}
