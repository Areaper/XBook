//
//  pushViewController.swift
//  XBook
//
//  Created by leon on 16/3/22.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class pushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setNavigationBar()
        // Do any additional setup after loading the view.
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
