//
//  Push_TitleViewController.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

typealias PushTitleCallBack = (title: String) -> Void

class Push_TitleViewController: UIViewController {
    
    // 实现回调
    // 1.闭包
    // 2.delegate
    // 3.通知 NSNotification
    
    var callBack: PushTitleCallBack?
    
    var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        textField = UITextField(frame: CGRectMake(15, 60, ScreenWidth - 30, 30))
        textField.borderStyle = .RoundedRect
        textField.placeholder = "书评标题"
        textField.font = UIFont(name: MyFont, size: 15)
        view.addSubview(textField)
        
        // 直接跳出键盘
        textField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sure() {
        self.callBack!(title: self.textField.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    

}
