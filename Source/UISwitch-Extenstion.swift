//
//  UISwitch-Extenstion.swift
//  Intelligence
//
//  Created by cuirhong on 2017/9/29.
//  Copyright © 2017年 cuirhong. All rights reserved.
//

import Foundation
import UIKit


@objc public extension UISwitch{

   @objc convenience init(isOn:Bool=false,onTintColor:UIColor?=nil,tintColor:UIColor?=nil,thumbColor:UIColor?=nil,onImage:UIImage?=nil,offImage:UIImage?=nil,target: Any?=nil ,selector: Selector?=nil ) {
        self.init()
        self.isOn = isOn
        
        if let color = onTintColor{//开启状态下的颜色
            self.onTintColor = color
        
        }
        
        if let color = tintColor{//关闭状态下的颜色
         self.tintColor = color
        
        }
        
        if let color = thumbColor{//小圆点的颜色
            self.thumbTintColor = color
        
        }
        
        if let image = onImage{ //开启时的图片
            self.onImage = image
        
        
        }
        
        if let image = offImage{//关闭时的图片
            self.offImage = image
        
        }
        
        if let newTarget = target,let newSelector = selector{
            addTarget(newTarget, action: newSelector, for: .valueChanged)
        
        }
 
    }
 
}















