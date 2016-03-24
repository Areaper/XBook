//
//  RegisterViewController.swift
//  XBook
//
//  Created by leon on 16/3/24.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var topLayout: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func register(sender: AnyObject) {
        let user = AVUser()
        user.username = self.username.text
        user.password = self.password.text
        user.email = self.email.text
        user.signUpInBackgroundWithBlock { (success, error) -> Void in
            if success {
                ProgressHUD.showSuccess("注册成功, 请验证邮箱")
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                if error.code == 125 {
                    ProgressHUD.showError("邮箱不合法")
                    
                }
                else if error.code == 203 {
                    ProgressHUD.showError("该邮箱已注册")
                }
                else if error.code == 202 {
                    ProgressHUD.showError("用户名已存在")
                }
                else {
                    ProgressHUD.showError("注册失败")
                }
                
            }
        }
        
        
    }
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func keyboardWillShowNotification(notifacation: NSNotification) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = -200
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = 8
            self.view.layoutIfNeeded()
        }
        
    }
    

    

}