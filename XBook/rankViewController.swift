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
        
        AVUser.logOut()
        
        if AVUser.currentUser() == nil {
            let story = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = story.instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(loginVC, animated: true, completion: nil)
        }

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
