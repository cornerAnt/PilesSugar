//
//  ExploreMainCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit



@objc protocol ExploreMainCellDetegate {
    
    // 点击了哪个cell
    func exploreCollectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    
 
    
}

private let ExploreBannerCellID = "ExploreBannerCell"

class ExploreMainCell: UITableViewCell {

    
    weak var delegate: ExploreMainCellDetegate?
    
    var exploreMainModel: ExploreMainModel!{
        didSet{
            
            if exploreMainModel.content_type == "banner"{
                
                layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
                layout.itemSize = CGSize(width: 100, height: 120)
                
                categoryLabel.layer.backgroundColor = nil
            }else{
                layout.scrollDirection = UICollectionViewScrollDirection.Vertical
                layout.itemSize = CGSize(width: kMainScreenW * 0.5 - 20, height: 30)
                
                
            }
            categoryLabel.text = exploreMainModel.group_name
            
            collectionView.reloadData()
        }
    }
    
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!{
        didSet{
            categoryLabel.layer.borderWidth = 0
            categoryLabel.layer.cornerRadius = 10
            categoryLabel.layer.backgroundColor = UIColor.randomColor().CGColor
           
        }
    }
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    
        
        collectionView.alwaysBounceVertical = false
    
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 0
        
        collectionView.registerNib(UINib(nibName: ExploreBannerCellID, bundle: nil), forCellWithReuseIdentifier: ExploreBannerCellID)

        collectionView.dataSource = self
        collectionView.delegate = self

        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ExploreMainCell : UICollectionViewDataSource {
    
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        
        return exploreMainModel.group_items.count

       
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ExploreBannerCellID, forIndexPath: indexPath) as! ExploreBannerCell
    
        
            cell.titleLabel.text = exploreMainModel.group_items[indexPath.row].name
            cell.photoImageView.yy_imageURL = NSURL(string: exploreMainModel.group_items[indexPath.row].icon_url)
        

            return cell
   
    }
    
    
    
    
}
extension ExploreMainCell : UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        guard let temp = delegate else {
            
            return
        }
      
        
        temp.exploreCollectionView(self.collectionView, didSelectItemAtIndexPath: indexPath)
        
    }
}

