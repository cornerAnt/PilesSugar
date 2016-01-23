//
//  ClubHotController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/13.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

private let ClubHotCellID = "ClubHotCell"

class ClubHotController: UITableViewController {

    
    var models = [ClubHotModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         setupTableView()
        loadData()
    }
    
    private func setupTableView() {
        
        tableView!.registerNib(UINib(nibName: ClubHotCellID, bundle: nil), forCellReuseIdentifier: ClubHotCellID)
        
        tableView!.tableFooterView = UIView()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: Selector("loadData"), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    @objc private func loadData(){
        
    let url = "http://www.duitang.com/napi/topic/list/by_tags/?__dtac=%257B%2522_r%2522%253A%2520%2522550043%2522%257D&app_code=gandalf&app_version=5.8%20rv%3A149591&device_name=Unknown%20iPhone&device_platform=iPhone6%2C1&limit=25&locale=zh_CN&platform_name=iPhone%20OS&platform_version=9.2&screen_height=568&screen_width=320&start=0&tags=%E7%B2%BE%E9%80%89"
        
    NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
        
        self.models = ClubHotModel.loadCulbHotModels(response!)
        
        self.tableView.reloadData()
        
        self.refreshControl?.endRefreshing()
        
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

extension ClubHotController {
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ClubHotCellID, forIndexPath: indexPath) as! ClubHotCell
        
        cell.clubHotModel = models[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = models[indexPath.row]
        
        return model.modelHeight
    }
}

// MARK: - TableviewDelegate

extension ClubHotController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let model = models[indexPath.row]
        
        let vc = ClubTopicController()
        
        vc.topicID = "\(model.id!)"
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
