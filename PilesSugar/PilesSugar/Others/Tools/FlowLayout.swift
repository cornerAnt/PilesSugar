//
//  FlowLayout.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/13.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {

    
    override init() {
        super.init()
        
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        itemSize = CGSize(width: 200, height: 200)
        minimumInteritemSpacing = 10
        sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
