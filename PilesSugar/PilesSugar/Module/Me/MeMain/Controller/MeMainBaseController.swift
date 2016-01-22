//
//  MeMainBaseController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/11.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit

private let MeBaseCellID = "MeBaseCell"

class MeMainBaseController: UITableViewController {
    
    // 所有数据
    var groups = [MeGroupModel]()
    
    // MARK: - 生命周期
    
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
        
        tableView.registerClass(MeBaseCell.self, forCellReuseIdentifier: MeBaseCellID)
        tableView.sectionFooterHeight = 0;
        tableView.sectionHeaderHeight = 10;
        
    }
}
// MARK: - Table view data source

extension MeMainBaseController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return groups.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let group = groups[section]
        
        return group.items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(MeBaseCellID, forIndexPath: indexPath) as! MeBaseCell
        
        let group  = groups[indexPath.section]
        let item   = group.items[indexPath.row]
        
        cell.item = item;
        
        
        return cell
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        
        let group = groups[section]
        
        return group.headerTitle
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        
        let group = groups[section]
        
        return group.footerTitle
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 45
    }
}
// MARK: - Table view delegate

extension MeMainBaseController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let item = groups[indexPath.section].items[indexPath.row]
        
        if let target = item.itemTarget {
            
            target(indexPath: indexPath)
            return
        }
        
       
        if let targetVc = item.targetViewController {
            
           let vc = targetVc()
            
            navigationController?.pushViewController(vc, animated: true)
            
            return
        }
    
        navigationController?.pushViewController(TestViewController(), animated: true)
        
    }
    
    
}
