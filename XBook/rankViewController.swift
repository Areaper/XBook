//
//  rankViewController.swift
//  XBook
//
//  Created by leon on 16/3/22.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class rankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel(frame: CGRectMake(0, 0, 200, 40))
        label.textAlignment = NSTextAlignment.Center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: MyFont, size: 14)
        label.center = view.center
        label.text = "我是 leon , 哈哈哈"
        label.textColor = UIColor.blackColor()
        
        view.addSubview(label)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
