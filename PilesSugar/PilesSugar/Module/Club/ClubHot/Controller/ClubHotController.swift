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

    
   private var models = [ClubHotModel]()
    
   private var pageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         setupTableView()
        
        
    }
    
    private func setupTableView() {
        
        tableView!.registerNib(UINib(nibName: ClubHotCellID, bundle: nil), forCellReuseIdentifier: ClubHotCellID)
        
        tableView!.tableFooterView = UIView()
        
        tableView!.mj_header = RefreshHeader.init(refreshingBlock: { () -> Void in
            
            self.loadNewData()
        })
        tableView!.mj_header.beginRefreshing()
        tableView!.mj_footer = RefreshFooter.init(refreshingBlock: { () -> Void in
            self.loadMoreData()
        })
        
    }
    
     private func loadNewData(){
        
    let url = "http://www.duitang.com/napi/topic/list/by_tags/?&start=0&tags=%E7%B2%BE%E9%80%89"
        
    NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
        
        self.models = ClubHotModel.loadCulbHotModels(response!)
        
        
        self.tableView.reloadData()
        
        self.tableView!.mj_header.endRefreshing()
        
        }) { (error) -> () in
            
            DEBUGLOG(error)
           self.tableView!.mj_header.endRefreshing()

    }
        
    }
    
    private func loadMoreData(){
        
        pageCount += 25
        
        let url = "http://www.duitang.com/napi/topic/list/by_tags/?&start=" + "\(pageCount)" + "&tags=%E7%B2%BE%E9%80%89"
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
            
            self.models += ClubHotModel.loadCulbHotModels(response!)
            
            self.tableView.reloadData()
            
            self.tableView!.mj_footer.endRefreshing()
            
            }) { (error) -> () in
                
                
            self.tableView!.mj_footer.endRefreshing()
                
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
        
        let clubHotModel = models[indexPath.row]

        return clubHotModel.modelHeight

    }
}

// MARK: - TableviewDelegate

extension ClubHotController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let model = models[indexPath.row]
        
        let vc = ClubTopicController()
        
        
        vc.clubTopicModel = model
        navigationController?.pushViewController(vc, animated: true)
    }
}
