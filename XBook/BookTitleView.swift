//
//  BookTitleView.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

@objc protocol BookTitleDelegate {
    optional func choiceCover()
}

class BookTitleView: UIView {

    var BookCover: UIButton?
    
    var BookName: JVFloatLabeledTextField?
    
    var BookEditor: JVFloatLabeledTextField?
    
    weak var delegate: BookTitleDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        BookCover = UIButton(frame: CGRectMake(10, 8, 110, 141))
        BookCover?.setImage(UIImage(named: "Cover"), forState: .Normal)
        self.addSubview(BookCover!)
        BookCover?.addTarget(self, action: "choiceCover", forControlEvents: .TouchUpInside)
        
        BookName = JVFloatLabeledTextField(frame: CGRectMake(128, 8 + 40, ScreenWidth - 128 - 15, 30))
        BookEditor = JVFloatLabeledTextField(frame: CGRectMake(128, 8 + 70 + 40, ScreenWidth - 128 - 15, 30))
        
        BookName?.placeholder = "书名"
        BookName!.font = UIFont(name: MyFont, size: 13)
        BookEditor?.placeholder = "作者"
        BookEditor!.font = UIFont(name: MyFont, size: 13)
        
        BookName?.floatingLabelFont = UIFont(name: MyFont, size: 14)
        BookEditor?.floatingLabelFont = UIFont(name: MyFont, size: 14)
        
        self.addSubview(BookName!)
        self.addSubview(BookEditor!)
        
        
        
    }
    
    func choiceCover() {
        self.delegate!.choiceCover!()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
