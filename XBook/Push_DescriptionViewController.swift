//
//  Push_DescriptionViewController.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

typealias Push_DescriptionControllerBlock = (description: String) -> Void


class Push_DescriptionViewController: UIViewController {
    
    var textView: JVFloatLabeledTextView!
    
    var callBack: Push_DescriptionControllerBlock?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        textView = JVFloatLabeledTextView(frame: CGRectMake(8, 58, ScreenWidth - 16, ScreenHeight - 58 - 8))
        view.addSubview(textView)
        textView.placeholder = "        你可以在这里撰写详细的评价~~"
        textView.font = UIFont(name: MyFont, size: 17)
        view.tintColor = UIColor.grayColor()
        textView.becomeFirstResponder()
        
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sure() {
        self.callBack!(description: self.textView.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    // 键盘遮挡
    func keyboardWillHideNotification(notification: NSNotification) {
        self.textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
    }
    func keyboardWillShowNotification(notification: NSNotification) {
        let rect = XKeyBoard.returnKeyBoardWindow(notification)
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
        
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
