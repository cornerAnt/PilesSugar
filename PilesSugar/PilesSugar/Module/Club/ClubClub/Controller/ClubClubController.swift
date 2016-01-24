//
//  ClubClubController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/21.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
private let ClubClubCellID = "ClubClubCell"

class ClubClubController: UITableViewController {
    
    
    var models = [ClubClubModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        
        
    }
    
    init(){
        
    super.init(style: UITableViewStyle.Grouped)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        
        tableView!.registerNib(UINib(nibName: ClubClubCellID, bundle: nil), forCellReuseIdentifier: ClubClubCellID)
        
        tableView!.tableFooterView = UIView()
        tableView!.rowHeight = 50
        tableView!.contentInset.top = 29
        tableView!.sectionHeaderHeight = 0
        tableView!.sectionFooterHeight = 10
       loadNewData()
//        tableView!.mj_header = RefreshHeader.init(refreshingBlock: { () -> Void in
//            
//            self.loadNewData()
//        })
//        tableView!.mj_header.beginRefreshing()
    }
    
     private func loadNewData(){
        
        let url = "http://www.duitang.com/napi/club/list/by_user_id/?app_code=gandalf&app_version=5.8%20rv%3A149591&device_name=Unknown%20iPhone&device_platform=iPhone6%2C1&include_fields=check_in&limit=0&locale=zh_CN&platform_name=iPhone%20OS&platform_version=9.2.1&screen_height=568&screen_width=320&start=0&user_id=11189659"
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
            
            self.models = ClubClubModel.loadClubClubModels(response!)
            
            self.tableView.reloadData()
            
//            self.tableView!.mj_header.endRefreshing()
            
            }) { (error) -> () in
                
                DEBUGLOG(error)
//            self.tableView!.mj_header.endRefreshing()
                
        }
        
    }



}
// MARK: - TableviewDataSource

extension ClubClubController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? models.count : 1

    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCellWithIdentifier(ClubClubCellID, forIndexPath: indexPath) as! ClubClubCell
        
        if indexPath.section == 0 {
            
        cell.clubClubModel = models[indexPath.row]
        cell.nameLabel.textColor = UIColor.blackColor()
    
        }else {
            
         cell.photoImageView.image = UIImage(named: "more_club")
         cell.nameLabel.text = "浏览更多Club"
         cell.nameLabel.textColor = UIColor.grayColor()
         cell.unreadLabel.text = ">"
            
        }
        
        return cell
         

    }
    
  
}

// MARK: - TableviewDelegate

extension ClubClubController {

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.section == 1 {
            
            let vc = ClubMoreController()
        
            navigationController?.pushViewController(vc, animated: true)
        }
    
    }
    
    

}
