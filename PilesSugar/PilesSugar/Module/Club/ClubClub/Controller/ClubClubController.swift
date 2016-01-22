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
        
        loadData()        
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
        tableView!.tableHeaderView = UIView()
        tableView!.contentInset.top = 29

        tableView!.sectionHeaderHeight = 10
        tableView!.sectionFooterHeight = 0

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: Selector("loadData"), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    @objc private func loadData(){
        
        let url = "http://www.duitang.com/napi/club/list/by_user_id/?app_code=gandalf&app_version=5.8%20rv%3A149591&device_name=Unknown%20iPhone&device_platform=iPhone6%2C1&include_fields=check_in&limit=0&locale=zh_CN&platform_name=iPhone%20OS&platform_version=9.2.1&screen_height=568&screen_width=320&start=0&user_id=11189659"
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
            
            self.models = ClubClubModel.loadClubClubModels(response!)
            
            self.tableView.reloadData()
            
            self.refreshControl?.endRefreshing()
            
            }) { (error) -> () in
                
                DEBUGLOG(error)
                self.refreshControl?.endRefreshing()
                
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
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
         return 50
    }
}

