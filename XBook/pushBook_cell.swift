//
//  pushBook_cell.swift
//  XBook
//
//  Created by leon on 16/3/24.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

class pushBook_cell: UITableViewCell {
    
    var BookName: UILabel?
    var Editor: UILabel?
    var more: UILabel?
    
    var cover: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        BookName = UILabel(frame: CGRectMake(78, 8, 242, 25))
        Editor = UILabel(frame: CGRectMake(78, 33, 242, 25))
        more = UILabel(frame: CGRectMake(78, 66, 242, 25))
        
        BookName?.font = UIFont(name: MyFont, size: 15)
        Editor?.font = UIFont(name: MyFont, size: 15)
        more?.font = UIFont(name: MyFont, size: 13)
        
        more?.textColor = UIColor.grayColor()
        
        self.addSubview(BookName!)
        self.addSubview(Editor!)
        self.addSubview(more!)
        
        self.cover = UIImageView(frame: CGRectMake(8, 9, 56, 70))
        contentView.addSubview(self.cover!)
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
