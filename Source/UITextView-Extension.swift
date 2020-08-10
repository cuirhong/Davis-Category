//
//  UITextView-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/28.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

/// 扩展textView的placeholder属性
@objc public extension UITextView {
   @objc convenience init(text:String,font:UIFont?=nil, textColor:UIColor?=nil,backColor:UIColor?=nil) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        
        if let color = backColor{
            backgroundColor = color
        }
     
    }
 
}




