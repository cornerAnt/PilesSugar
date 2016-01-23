//
//  ClubTopicController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

private let  ClubTopicCellID = "ClubTopicCell"
class ClubTopicController: UITableViewController {

    var topicID = ""
    var models = [ClubTopicModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        loadData()
    }
    
    private func setupTableView() {
        
        tableView!.registerNib(UINib(nibName: ClubTopicCellID, bundle: nil), forCellReuseIdentifier: ClubTopicCellID)
        
        tableView!.tableFooterView = UIView()
        
         tableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        title = "话题详细"
        
    }
    
     private func loadData(){
        
        let url = "http://www.duitang.com/napi/topic/comment/list/?topic_id=" + topicID
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
            
            self.models = ClubTopicModel.loadClubTopicModels(response!)
            self.tableView.reloadData()
       
            }) { (error) -> () in
                
                DEBUGLOG(error)
                self.refreshControl?.endRefreshing()
                
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
// MARK: - TableviewDataSource

extension ClubTopicController {
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ClubTopicCellID, forIndexPath: indexPath) as! ClubTopicCell
        
      cell.clubTopicModel = models[indexPath.row]
        return cell
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        return tableView.fd_heightForCellWithIdentifier(ClubTopicCellID, cacheByIndexPath: indexPath, configuration: { (AnyObject) -> Void in
            
            (AnyObject as! ClubTopicCell).clubTopicModel = self.models[indexPath.row]
        })
        
    }
}

// MARK: - TableviewDelegate

extension ClubTopicController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        DEBUGLOG(indexPath.row)
    }
}
