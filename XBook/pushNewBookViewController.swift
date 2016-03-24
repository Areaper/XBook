//
//  pushNewBookViewController.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController, BookTitleDelegate, PhotoPickerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    
    var titleArray: Array<String> = []
    
    var BookTitle = ""
    
    var score: LDXScore!
    
    // 表示是否显示星星
    var showScore = false
    
    var type = "文学"
    var detailType = "文学"
    
    var Book_Description = ""
    
    // 封面视图
    var bookTitleView: BookTitleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        bookTitleView = BookTitleView(frame: CGRectMake(0, 40, ScreenWidth, 160))
        self.view.addSubview(bookTitleView)
        bookTitleView.delegate = self
        
        tableView = UITableView(frame: CGRectMake(0, 200, ScreenWidth, ScreenHeight), style: .Grouped)
        // 使没有内容的线条消失
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView?.backgroundColor = UIColor(colorLiteralRed: 250 / 255, green: 250 / 255, blue: 250 / 255, alpha: 1)
        view.addSubview(tableView!)
        
        titleArray = ["标题", "评分", "分类", "书评"]
        
        score = LDXScore(frame: CGRectMake(100, 10, 100, 22))
        score.isSelect = true
        score.normalImg = UIImage(named: "btn_star_evaluation_normal")
        score.highlightImg = UIImage(named: "btn_star_evaluation_press")
        score.max_star = 5
        score.show_score = 5
        
        
        // 注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pushBookNotification:", name: "pushBookNotification", object: nil)
    }
    
    // pushBookNotification
    func pushBookNotification(notification: NSNotification) {
        let dict = notification.userInfo
        if dict!["success"] as! String == "true" {
            ProgressHUD.showSuccess("上传成功")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            ProgressHUD.showError("上传失败")
        }
        
    }
    
    // MARK: UITableView && UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        if indexPath.row != 1 {
            cell.accessoryType = .DisclosureIndicator
        }
                
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: MyFont, size: 15)
        cell.detailTextLabel?.font = UIFont(name: MyFont, size: 13)
        
        var row = indexPath.row
        if showScore && row > 1 {
            row--
        }
        switch row {
        case 0:
            cell.detailTextLabel?.text = self.BookTitle
            break
        case 2:
            cell.detailTextLabel?.text = self.type + "->" + self.detailType
        case 4:
            cell.accessoryType = .None
            let commentView = UITextView(frame: CGRectMake(4, 4, ScreenWidth - 8, 80))
            commentView.text = self.Book_Description
            commentView.font = UIFont(name: MyFont, size: 14)
            cell.contentView.addSubview(commentView)
        
        default:
            break
        
        }

        
        
        if self.showScore && indexPath.row == 2 {
            cell.contentView.addSubview(self.score)
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if showScore && indexPath.row > 5 {
            return 88
        }
        else if self.showScore && indexPath.row > 4 {
            return 88
        }
        else {
            return 44
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        var row = indexPath.row
        if self.showScore && row > 1 {
            row -= 1
        }
        switch row {
        case 0:
            tableViewSelectTitle()
            break
        case 1:
            tableViewSelectScore()
            break
        case 2:
            tableViewSelectType()
            break
        case 3:
            tableViewSelectDescription()
            break
        default:
            break
            
        }
    }
    
    // 选择标题
    func tableViewSelectTitle() {
        let vc = Push_TitleViewController()
        vc.callBack = {
            (title: String) -> Void in
            self.BookTitle = title
            self.tableView?.reloadData()
        }
        generalFactory.addTitleWithTitle(vc)
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    // 选择评分
    func tableViewSelectScore() {
        self.tableView?.beginUpdates()
        
        let tempIndexPath = [NSIndexPath(forRow: 2, inSection: 0)]
        
        if self.showScore {
            self.titleArray.removeAtIndex(2)
            tableView?.deleteRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Right)
            self.showScore = false
        }
        else {
            self.titleArray.insert("", atIndex: 2)
            self.tableView?.insertRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Left)
            self.showScore = true
            
        }
        
        self.tableView?.endUpdates()

        
        
        
    }
    
    deinit {
        print("pushNewBookController realise")
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    // 选择分类
    func tableViewSelectType() {
        let vc = Push_TypeViewController()
        generalFactory.addTitleWithTitle(vc)
        let btn1 = vc.view.viewWithTag(1234) as! UIButton
        let btn2 = vc.view.viewWithTag(1235) as! UIButton
        btn1.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)
        btn2.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)

        vc.type = self.type
        vc.detailType = self.detailType
        
        
        
        vc.callBack = {
            (type: String, detailType: String) -> Void in
            self.type = type
            self.detailType = detailType
            self.tableView?.reloadData()
        }
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    // 选择书评
    func tableViewSelectDescription() {
        let vc = Push_DescriptionViewController()
        generalFactory.addTitleWithTitle(vc)
        
        vc.textView.text = self.Book_Description
        vc.callBack = {
            (description: String) -> Void in
            self.Book_Description = description
            if self.titleArray.last == "" {
                self.titleArray.removeLast()
            }
            if description != "" {
                self.titleArray.append("")
            }
            self.tableView?.reloadData()
            
            
            
        }
        self.presentViewController(vc, animated: true, completion: nil)
    }
    

    // 代理方法
    func choiceCover() {
        
        let photoPickVC = PhotoPickerViewController()
        photoPickVC.delegate = self
        
        presentViewController(photoPickVC, animated: true, completion: nil)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func sure() {
        
        let dict = [
            "BookName": (self.bookTitleView?.BookName?.text)!,
            "BookEditor":(self.bookTitleView?.BookEditor?.text)!,
            "BookCover": (self.bookTitleView?.BookCover?.currentImage)!,
            "title": self.BookTitle,
            "score": String((self.score?.show_star)!),
            "type": self.type,
            "detailType": self.detailType,
            "description": self.Book_Description
        
        ]
        
        pushBook.pushBookInBack(dict)
        
    }
    
    func getImageFromPicker(image: UIImage) {
        self.bookTitleView.BookCover?.setImage(image, forState: .Normal)
    }
    

    

}
