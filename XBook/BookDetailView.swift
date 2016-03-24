//
//  BookDetailView.swift
//  XBook
//
//  Created by leon on 16/3/24.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class BookDetailView: UIView {
    
    var view_width: CGFloat!
    var view_height: CGFloat!
    
    
    var BookName: UILabel?
    var Editor: UILabel?
    var userName: UILabel?
    var date: UILabel?
    var more: UILabel?
    var score: LDXScore?
    var cover: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view_width = frame.size.width
        view_height = frame.size.height
        
        cover = UIImageView(frame: CGRectMake(8, 8, (view_height - 16) / 1.273, (view_width - 16)))
        self.addSubview(cover!)
        
        BookName = UILabel(frame: CGRectMake((view_height - 16) / 1.273 + 16, 8, view_width - (view_height - 16) / 1.273 - 16, view_height / 4))
        BookName?.font = UIFont(name: MyFont, size: 18)
        self.addSubview(BookName!)
        
        Editor = UILabel(frame: CGRectMake((view_height - 16) / 1.273 + 16, 8 + view_height / 4, view_width - (view_height - 16) / 1.273 - 16, view_height / 4))
        Editor?.font = UIFont(name: MyFont, size: 18)
        self.addSubview(Editor!)
        
        userName = UILabel(frame: CGRectMake((view_height - 16) / 1.273 + 16, 24 + view_height / 4 + view_height / 6, view_width - (view_height - 16) / 1.273 - 16, view_height / 6))
        userName?.font = UIFont(name: MyFont, size: 13)
        self.addSubview(userName!)
        userName?.textColor = RGB(35, g: 87, b: 139)
        
        
        date = UILabel(frame: CGRectMake((view_height - 16) / 1.273 + 16, 16 + view_height / 4 + view_height / 6 * 2, 80, view_height / 6))
        date?.font = UIFont(name: MyFont, size: 13)
        date?.textColor = UIColor.grayColor()
        self.addSubview(date!)
        
        score = LDXScore(frame: CGRectMake((view_height - 16) / 1.273 + 16 + 80, 16 + view_height / 4 + view_height / 6 * 2, 80, view_height / 6))
        
        score!.isSelect = false
        score!.normalImg = UIImage(named: "btn_star_evaluation_normal")
        score!.highlightImg = UIImage(named: "btn_star_evaluation_press")
        score!.max_star = 5
        score!.show_score = 5
        
        self.addSubview(score!)
        
        self.more = UILabel(frame: CGRectMake((view_height - 16) / 1.273 + 16, 8 + view_height / 4 + view_height / 6 * 3, view_width - (view_height - 16) / 1.273 - 16, view_height / 6))
        
        more?.font = UIFont(name: MyFont, size: 13)
        self.addSubview(more!)
        more?.textColor = UIColor.grayColor()
        
        
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 0.5)
        CGContextSetRGBFillColor(context, 231/255, 231/255, 231/255, 1)
        CGContextMoveToPoint(context, 8, view_height - 2)
        CGContextAddLineToPoint(context, view_width - 8, view_height - 2)
        CGContextStrokePath(context)
        
        
        
        
        
        
    }

    

}
