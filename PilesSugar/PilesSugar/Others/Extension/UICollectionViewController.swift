//
//  MeSettingController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
extension UICollectionViewController {
    
     func registerCellWithID(cellID : String) {
    
        collectionView!.registerNib(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    func registerHeaderWithID(cellID : String) {
        
        collectionView!.registerNib(UINib(nibName: cellID, bundle: nil), forSupplementaryViewOfKind:
            UICollectionElementKindSectionHeader, withReuseIdentifier: cellID)
    }
    
    func registerFooterWithID(cellID : String) {
        
        collectionView!.registerNib(UINib(nibName: cellID, bundle: nil), forSupplementaryViewOfKind:
            UICollectionElementKindSectionFooter, withReuseIdentifier: cellID)
    }
}