//
//  pushViewController.swift
//  XBook
//
//  Created by leon on 16/3/22.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class pushViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray = NSMutableArray()
    
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setNavigationBar()
        
        tableView = UITableView(frame: self.view.frame)
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
        tableView?.tableFooterView = UIView()
        tableView?.registerClass(pushBook_cell.self, forCellReuseIdentifier: "cell")
        
        tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "headRefresh")
        tableView?.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: "footRefresh")
        
        tableView?.mj_header.beginRefreshing()
        
        
    }
    
    // 上拉加载 下拉刷新
    func headRefresh() {
        let query = AVQuery(className: "AVObject")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = self.dataArray.count
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (result, error) -> Void in
            self.tableView?.mj_header.endRefreshing()
            self.dataArray.removeAllObjects()
            self.dataArray.addObjectsFromArray(result)
            self.tableView?.reloadData()
            
        }
        
    }
    
    func footRefresh() {
        
        let query = AVQuery(className: "AVObject")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = self.dataArray.count
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (result, error) -> Void in
            self.tableView?.mj_footer.endRefreshing()
            self.dataArray.addObjectsFromArray(result)
            self.tableView?.reloadData()
            
        }
        
    }
    
    // uitableviewdelegate datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! pushBook_cell
        
        let dict = dataArray[indexPath.row] as! AVObject
        
        cell.BookName?.text = "《" + (dict["BookName"] as! String) + "》:" + (dict["title"] as! String)
        cell.Editor?.text = "作者" + (dict["BookEditor"] as! String)
        let date = dict["createdAt"] as! NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        cell.more?.text = format.stringFromDate(date)
        
        let coverFile = dict["cover"] as! AVFile
        cell.cover?.sd_setImageWithURL(NSURL(string: coverFile.url), placeholderImage: UIImage(named: "Cover"))
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = BookDetailViewController()
        vc.BookObject = self.dataArray[indexPath.row] as! AVObject
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setNavigationBar() {
        let navigationView = UIView(frame: CGRectMake(0, -20, ScreenWidth, 65))
        navigationView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(navigationView)
        
        let btn = UIButton(frame: CGRectMake(20, 20, ScreenWidth, 45))
        btn.setImage(UIImage(named: "plus circle"), forState: .Normal)
        btn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        btn.setTitle("    新建书评", forState: .Normal)
        btn.titleLabel?.font = UIFont(name: MyFont, size: 15)
        btn.contentHorizontalAlignment = .Left
        btn.addTarget(self, action: "pushNewBook", forControlEvents: .TouchUpInside)
        navigationView.addSubview(btn)
    }
    
    func pushNewBook() {
        let pushVC = pushNewBookViewController()
        generalFactory.addTitleWithTitle(pushVC, title1: "关闭", title2: "确认")
        
        presentViewController(pushVC, animated: true, completion: nil)
    }

}
