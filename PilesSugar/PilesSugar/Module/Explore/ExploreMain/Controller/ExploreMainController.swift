//
//  ExploreMainController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

private let ExploreMainCellID = "ExploreMainCell"
private let urlString = "http://www.duitang.com/napi/index/groups/?app_code=gandalf&app_version=5.9%20rv%3A150681&device_name=Unknown%20iPhone&device_platform=iPhone6%2C1&locale=zh_CN&platform_name=iPhone%20OS&platform_version=9.2.1&screen_height=568&screen_width=320"

class ExploreMainController: UITableViewController {

    var models = [ExploreMainModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupTableView()
        
      
    }
    private func setupTableView() {
        
        tableView.registerNib(UINib(nibName: ExploreMainCellID, bundle: nil), forCellReuseIdentifier: ExploreMainCellID)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.contentInset.top = 5
        loadData()
    }
    
    private func loadData(){
        
        
        
        
        NetWorkTool.sharedInstance.get(urlString, parameters: nil, success: { (response) -> () in
            
            self.models = ExploreMainModel.loadExploreMainModels(response!)
            
            
            self.tableView.reloadData()
            
            }) { (error) -> () in
                
                DEBUGLOG(error)
                
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
// MARK: - Table view data source

extension ExploreMainController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ExploreMainCellID) as! ExploreMainCell
        
        cell.exploreMainModel = models[indexPath.row]
        
        cell.delegate = self
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 180 : 120
    }
}


extension ExploreMainController : ExploreMainCellDetegate {

    func exploreCollectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        DEBUGLOG(indexPath)
    }
    
}
