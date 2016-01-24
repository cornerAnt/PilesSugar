//
//  ClubTopicController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

private let  ClubTopicCellID = "ClubTopicCell"
private let  ClubTopicHeaderCellID = "ClubTopicHeaderCell"


class ClubTopicController: UITableViewController {

 
    var clubTopicModels = [[ClubTopicModel](),[ClubTopicModel]()]
   
    var clubTopicModel : ClubHotModel!
    init(){
        super.init(style: UITableViewStyle.Grouped)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        loadData()
    }
    
    private func setupTableView() {
        
        tableView!.registerNib(UINib(nibName: ClubTopicCellID, bundle: nil), forCellReuseIdentifier: ClubTopicCellID)
        tableView!.registerNib(UINib(nibName: ClubTopicHeaderCellID, bundle: nil), forCellReuseIdentifier: ClubTopicHeaderCellID)
        

        
        tableView!.tableFooterView = UIView()
    
        
         tableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        title = "话题详细"
        
    }
    
     private func loadData(){
        
        let url = "http://www.duitang.com/napi/topic/comment/list/?topic_id=" + "\(clubTopicModel.id)"
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
            
            self.clubTopicModels = ClubTopicModel.loadClubTopicModels(response!)
            self.tableView.reloadData()
       
            }) { (error) -> () in
                
        }


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
// MARK: - TableviewDataSource

extension ClubTopicController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
               return clubTopicModels.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

               return clubTopicModels[section].count
    
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
  
        let cell = tableView.dequeueReusableCellWithIdentifier(ClubTopicCellID, forIndexPath: indexPath) as! ClubTopicCell
        
        cell.clubTopicModel = clubTopicModels[indexPath.section][indexPath.row]
        
        
        return cell
        
       
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        return tableView.fd_heightForCellWithIdentifier(ClubTopicCellID, cacheByIndexPath: indexPath, configuration: { (AnyObject) -> Void in
            
            (AnyObject as! ClubTopicCell).clubTopicModel = self.clubTopicModels[indexPath.section][indexPath.row]
        })
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
         let view = TopicSectionHeader.loadFromXib()
        
        section == 0 ? (view.titleLabel.text = "热门评论") : (view.titleLabel.text = "所有评论")
        
        
        return view
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return  25 
    }
   
}

// MARK: - TableviewDelegate

extension ClubTopicController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        DEBUGLOG(indexPath.row)
    }
}
