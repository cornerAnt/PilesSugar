//
//  ClubMoreController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/22.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit


private let ClubThemeCellID = "ClubThemeCell"
private let ClubListCellID = "ClubListCell"


class ClubMoreController: UIViewController {

    @IBOutlet weak var clubThemeTableView: UITableView!
    @IBOutlet weak var clubListTableView: UITableView!
    
    
    let themeData = ["推荐","情感","生活","娱乐","明星","技术宅","手机控"]
    
      var  listData = [ClubListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    
    private func setupTableView() {
        
        view.autoresizingMask = UIViewAutoresizing.None
        
        title = "Club"
        
        clubThemeTableView.registerNib(UINib(nibName: ClubThemeCellID, bundle: nil), forCellReuseIdentifier: ClubThemeCellID)
//        leftTableView.contentInset.top = kNavgationBarH
        clubThemeTableView.selectRowAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.None)
        loadListData(NSIndexPath(forItem: 0, inSection: 0))
        
        clubThemeTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        clubListTableView.registerNib(UINib(nibName: ClubListCellID, bundle: nil), forCellReuseIdentifier: ClubListCellID)
        clubListTableView.contentInset.top = kNavgationBarH
         clubListTableView.rowHeight = 80

        
    }
    
    
    func loadListData(indexPath: NSIndexPath) {
        
        
        
        
        let url = "http://www.duitang.com/napi/club/list/by_filter_id/?filter_id=Club_" + themeData[indexPath.row].stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> ()  in
       
             self.listData =  ClubListModel.loadClubListModels(response!)
            
             self.clubListTableView.reloadData()
            
            }, failure: { (error) -> () in
                DEBUGLOG(error)
        })
    
    }


}
// MARK: - TableviewDataSource

extension ClubMoreController :UITableViewDataSource {
    

    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView === clubThemeTableView {
            
            return themeData.count
            
        }else{
            
            return listData.count
        }
        
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView === clubThemeTableView{
            
            let cell = tableView.dequeueReusableCellWithIdentifier(ClubThemeCellID)  as! ClubThemeCell
            
            cell.titleLabel.text = themeData[indexPath.row]
            
            return cell

        }else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier(ClubListCellID) as! ClubListCell
            
            cell.clubListModel = listData[indexPath.row]
            
            return cell

        }
        
        
    }
    
    
}


// MARK: - TableviewDelegate

extension ClubMoreController :UITableViewDelegate{


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView === clubThemeTableView {
            
         loadListData(indexPath)
        
    }
        
    }

}