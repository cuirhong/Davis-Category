//
//  UIProgressView-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/8/18.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import UIKit


@objc public extension UIProgressView{
    
    
   @objc convenience init(trackTintColor:UIColor?=nil,progressTintColor:UIColor?=nil,cornerRadius:Float=0.0){
        self.init()
        
        if let trackColor = trackTintColor{
             self.trackTintColor = trackColor
        }
        
        if let progressColor = progressTintColor{
             self.progressTintColor = progressColor
        }
 
        if cornerRadius > 0{
            self.layer.cornerRadius = CGFloat(cornerRadius)
            self.clipsToBounds = true
        }

    }
 
    
    
}












