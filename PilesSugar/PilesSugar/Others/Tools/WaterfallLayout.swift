//
//  WaterfallLayout.swift
//  UICollectionViewFlowLayout
//
//  Created by SoloKM on 16/1/12.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

    // MARK: - 协议
@objc protocol WaterfallLayoutDetegate {
    
    func waterfallLayout(waterfallLayout: WaterfallLayout, heightForRowAtIndexPath indexPath: NSIndexPath,columnWidth:CGFloat) -> CGFloat
    /**
     瀑布流的列数
     */
    optional  func columnCountInWaterflowLayout(waterfallLayout: WaterfallLayout) -> Int
    /**
     瀑布流的行间隙
     */
    optional   func columnMarginInWaterflowLayout(waterfallLayout: WaterfallLayout) -> CGFloat
    /**
     瀑布流的列
     */
    optional  func rowMarginInWaterflowLayout(waterfallLayout: WaterfallLayout) -> CGFloat
    /**
     瀑布流的内边距
     */
    optional  func edgeInsetsInWaterflowLayout(waterfallLayout: WaterfallLayout) -> UIEdgeInsets
}


class WaterfallLayout: UICollectionViewLayout {
    
    
    // MARK: - 属性
    
    weak  var delegate: WaterfallLayoutDetegate?
    
    // 默认行数
    private var columnCount:Int!{
        
        guard let temp = delegate?.columnCountInWaterflowLayout?(self) else{
            
            return 3
        }
        
        return temp
    }
    
    // 每一行的间距
    private var columnMargin : CGFloat!{
        
        guard let temp = delegate?.columnMarginInWaterflowLayout?(self) else{
            
            return 10.0
        }
        
        return temp
    }
    
    // 每一列的间距
    
    private var rowMargin : CGFloat!{
        
        guard let temp = delegate?.rowMarginInWaterflowLayout?(self) else {
            
            return 10.0
        }
        
        return temp
    }
    
    // 内边距
    
    private var edgeInsets : UIEdgeInsets!{
        
        guard let temp = delegate?.edgeInsetsInWaterflowLayout?(self) else{
            
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        
        return temp
    }
    
    // 所有cell的布局属性
    
    private var layoutAttributes = [UICollectionViewLayoutAttributes]()
    
    //  所有列的最大高度
    private var rowHeights = [CGFloat]()
    
    
    // MARK: - 初始化
    
    
    override func prepareLayout() {
        super.prepareLayout()
        
        
        // 1.清除以前高度的缓存
        rowHeights.removeAll()
        
        // 设置第一的初始高度
        for _ in 0..<columnCount {
            
            rowHeights.append(edgeInsets.top)
        }
        
        // 2.清除以前布局属性的缓存
        
        
        layoutAttributes.removeAll()
        
        
        // 3.创建cell的布局属性
        
        let count = collectionView!.numberOfItemsInSection(0)
        
        for index in  0..<count {
            
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            
            if let attributes = self.layoutAttributesForItemAtIndexPath(indexPath){
                layoutAttributes.append(attributes)
            }
        }
        
    }
    
    /**
     内容尺寸
     */
    
    override func collectionViewContentSize() -> CGSize {
        
        var maxRowHeight = rowHeights[0]
        
        for  index in 0..<columnCount {
            
            if maxRowHeight < rowHeights[index]{
                
                maxRowHeight = rowHeights[index]
            }
        }
        
        return CGSize(width: 0, height: maxRowHeight + edgeInsets.bottom)
    }
    
    
    /**
     决定cell排布
     */
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return  layoutAttributes
    }
    
    /**
     * 返回indexPath位置cell对应的布局属性
     */
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        // 创建布局
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        // 设置UICollectionView的宽度
        let collectionViewWidth = self.collectionView!.frame.width
        
        // 找出最短的一列
        var latestRow = 0
        
        var minrowHeight = rowHeights[0]
        
        for  index in 1..<columnCount {
            
            if minrowHeight > rowHeights[index]{
                
                minrowHeight = rowHeights[index]
                
                latestRow = index
            }
        }
        
        let attributesWidth = ( collectionViewWidth - edgeInsets.left - edgeInsets.right - (CGFloat (columnCount - 1)) * columnMargin ) / CGFloat (columnCount)
        
        guard let attributesHeight = delegate?.waterfallLayout(self, heightForRowAtIndexPath: indexPath, columnWidth: attributesWidth) else {
            
            return nil
        }
        
        let attributesX = edgeInsets.left +  CGFloat(latestRow) * ( attributesWidth + columnMargin )
        
        var attributesY = minrowHeight
        
        if minrowHeight == edgeInsets.top{
            
            attributesY = minrowHeight
            
        }else{
            
            attributesY = minrowHeight + columnMargin
        }
        
        // 设置每一个cell的frame
        
        attributes.frame = CGRect(x: attributesX, y: attributesY, width: attributesWidth, height: attributesHeight)
        
        // 更新最新的高度数组
        
        rowHeights[latestRow] = CGRectGetMaxY(attributes.frame)
        
        return attributes
    }
    
    
}

