//
//  UITextField-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/23.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import UIKit
@objc public extension UITextField{
     
    @objc convenience init(text:String="",placeholder:String?=nil,placeholderColor:UIColor?=nil,textColor:UIColor?=nil,font:UIFont? = nil,textAlignment:NSTextAlignment = .left) {


        self.init()
        self.text = text
        if placeholder != nil   {
            self.placeholder = placeholder
        }
        if placeholderColor != nil {
            self.attributedPlaceholder = NSAttributedString.init(string: placeholder!, attributes: [NSAttributedString.Key.foregroundColor:placeholderColor!])
        }


        if textColor != nil{
            self.textColor = textColor

        }

        if font != nil{

            self.font = font
        }

       self.textAlignment = textAlignment

    }
    
}









