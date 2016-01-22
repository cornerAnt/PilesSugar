//
//  MeBaseCell.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
import SnapKit
class MeBaseCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var item: MeItemModel? {
        
        didSet{
            //            if item?
            textLabel?.text = item?.title
            detailTextLabel?.text = item?.subtitle
            imageView?.image = item?.image
            if item?.type == ItemType.Switch{
                
                accessoryView = switchView
                selectionStyle = UITableViewCellSelectionStyle.None
                
            }else{
                
                accessoryView = nil
                accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
        }
        
    }
    
    override init( style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont.systemFontOfSize(13)
        detailTextLabel?.font = UIFont.systemFontOfSize(10)
        detailTextLabel?.textColor = UIColor.grayColor()
        tintColor = UIColor.greenColor();
        separatorInset.left = 0
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var switchView: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = UIColor.redColor()
        return mySwitch
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if detailTextLabel?.text != nil {
            
            let imageViewW =  (imageView?.frame.size.width)! * 0.7
            imageView?.frame.size = CGSize(width: imageViewW, height: imageViewW)
            imageView?.center = CGPointMake(contentView.center.y, contentView.center.y)
            
            textLabel?.frame.origin.x -= imageViewW * 0.5
            textLabel?.frame.origin.y -= 5
            detailTextLabel?.frame.origin.x -= imageViewW * 0.5
            detailTextLabel?.frame.origin.y += 5
        }
    }
 
}
