//
//  config.swift
//  XBook
//
//  Created by leon on 16/3/22.
//  Copyright © 2016年 leon. All rights reserved.
//

import Foundation

let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

let MainRed = UIColor(red: 235 / 255, green: 114 / 255, blue: 118 / 255, alpha: 1)


let MyFont = "Bauhaus ITC"

func RGB(r: Float, g: Float, b: Float) -> UIColor {
    return UIColor(colorLiteralRed: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
}