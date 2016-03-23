//
//  pushNewBookViewController.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController, BookTitleDelegate, PhotoPickerDelegate {
    
    // 封面视图
    var bookTitleView: BookTitleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        bookTitleView = BookTitleView(frame: CGRectMake(0, 40, ScreenWidth, 160))
        self.view.addSubview(bookTitleView)
        bookTitleView.delegate = self
        
        
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
        
    }
    
    func getImageFromPicker(image: UIImage) {
        self.bookTitleView.BookCover?.setImage(image, forState: .Normal)
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
