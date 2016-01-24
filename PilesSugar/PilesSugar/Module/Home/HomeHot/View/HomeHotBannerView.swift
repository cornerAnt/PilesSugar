//
//  HomeHotBannerView.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
private let HomeHotBannerCellID = "HomeHotBannerCell"
class HomeHotBannerView: UICollectionView {

    convenience init(frame: CGRect){
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = frame.size
        
        self.init(frame: frame, collectionViewLayout:layout )
        
        
        
        delegate = self
        dataSource = self
        
        registerNib(UINib(nibName: HomeHotBannerCellID, bundle: nil), forCellWithReuseIdentifier: HomeHotBannerCellID)
        
    }
  

}
extension  HomeHotBannerView: UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeHotBannerCellID, forIndexPath: indexPath) as! HomeHotBannerCell
        
        return cell
    }
    
}

extension  HomeHotBannerView: UICollectionViewDelegate {


}