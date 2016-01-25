//
//  HomeHotHeaderView.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

private let HomeHotBannerCellID = "HomeHotBannerCell"

class HomeHotHeaderView: UIView {

    
    var  models = [HomeHotBannerModel](){
        
        didSet{
            
            for var index = 0; index < models.count; index++ {
                
            index > 2 ? (banerModels.append(models[index])) : (topModels.append(models[index]))
        }
        }
    }
    
    private var banerModels = [HomeHotBannerModel]()
    private var topModels  = [HomeHotBannerModel]()

    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var pageControl: UIPageControl!

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    class func loadFromXib() -> HomeHotHeaderView {
        
     return    NSBundle.mainBundle().loadNibNamed("HomeHotHeaderView", owner: self, options: nil).first as! HomeHotHeaderView
    }
    
    override func awakeFromNib() {
        
        setupCollectionView()
        
        setupScrollView()
    }
    
    
    private func setupCollectionView(){
        collectionView.alwaysBounceVertical = false
        
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 0
        
        collectionView.registerNib(UINib(nibName: HomeHotBannerCellID, bundle: nil), forCellWithReuseIdentifier: HomeHotBannerCellID)
        
        collectionView.dataSource = self
    }
    
    
    
    
    private func setupScrollView(){
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: kMainScreenW * CGFloat(topModels.count), height: 130)
        
        
        DEBUGLOG(topModels.count)
         DEBUGLOG(banerModels.count)
        for var index = 0; index < topModels.count; index++ {

            
            DEBUGLOG(index)
            
            let imageView = UIImageView()
            
            imageView.yy_imageURL = NSURL(string: topModels[index].image_url)
            imageView.frame = CGRect(x: kMainScreenW * CGFloat(index), y: 0, width: kMainScreenW, height: 130)
            
            imageView.backgroundColor = UIColor.randomColor()
            scrollView.addSubview(imageView)
        }
    }
    
    func reloadData(){
        
        
        collectionView.reloadData()
        scrollView.layoutMarginsDidChange()
    }
    
    override func layoutSubviews() {
        
        DEBUGLOG(banerModels.count)
    }
    
   }

// MARK: - collectionViewDataSource

extension HomeHotHeaderView : UICollectionViewDataSource {
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        
        return  banerModels.count
        
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeHotBannerCellID, forIndexPath: indexPath) as! HomeHotBannerCell
        
        
        cell.iconImageView.yy_imageURL = NSURL(string: banerModels[indexPath.row].image_url)
        
        cell.titleLabel.text = banerModels[indexPath.row].desc
        
    
        
        return cell
        
    }
    
}
// MARK: - scrollView
extension HomeHotHeaderView: UIScrollViewDelegate{
    
    
    
}