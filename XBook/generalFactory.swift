//
//  generalFactory.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class generalFactory: NSObject {
    
    static func addTitleWithTitle(target: UIViewController, title1: String = "关闭", title2: String = "确认") {
        
        let button = UIButton(frame: CGRectMake(10, 20, 40, 20))
        button.setTitle(title1, forState: .Normal)
        button.titleLabel?.font = UIFont(name: MyFont, size: 14)
        button.setTitleColor(MainRed, forState: .Normal)
        button.contentHorizontalAlignment = .Left
        target.view.addSubview(button)
        
        let button1 = UIButton(frame: CGRectMake(ScreenWidth - 50, 20, 40, 20))
        button1.setTitle(title2, forState: .Normal)
        button1.titleLabel?.font = UIFont(name: MyFont, size: 14)
        button1.setTitleColor(MainRed, forState: .Normal)
        button1.contentHorizontalAlignment = .Right
        target.view.addSubview(button1)
        
        button.addTarget(target, action: "close", forControlEvents: .TouchUpInside)
        button1.addTarget(target, action: "sure", forControlEvents: .TouchUpInside)
        
    }

}
