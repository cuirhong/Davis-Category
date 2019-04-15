//
//  UITextField-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/23.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit
public extension UITextField{
 
    convenience init(placeholder:String?=nil,placeholderColor:UIColor?=nil,text:String?=nil,textColor:UIColor?=nil,font:UIFont?=nil,textAlignment:NSTextAlignment?=nil) {
        
        
        self.init()
        
        if placeholder != nil   {
          self.placeholder = placeholder
        }
        if placeholderColor != nil {
            self.attributedPlaceholder = NSAttributedString.init(string: placeholder!, attributes: [NSAttributedString.Key.foregroundColor:placeholderColor!])
            
         
        }

        if text != nil{
          self.text = text
        }
        
        if textColor != nil{
         self.textColor = textColor
        
        }
        
        if font != nil{
        
            self.font = font
        }
        
        if let textAli = textAlignment{
            self.textAlignment = textAli
        }
   
    }
 
}









