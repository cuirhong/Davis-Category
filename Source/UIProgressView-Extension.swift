//
//  UIProgressView-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/8/18.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import UIKit


public extension UIProgressView{
    
    
    convenience init(trackTintColor:UIColor?=nil,progressTintColor:UIColor?=nil,cornerRadius:CGFloat?=nil){
     
        self.init()
        
        if let trackColor = trackTintColor{
             self.trackTintColor = trackColor
        }
        
        if let progressColor = progressTintColor{
             self.progressTintColor = progressColor
        }
        
        
        if let radius = cornerRadius{
        
            self.layer.cornerRadius = radius
            self.clipsToBounds = true
        }

    }
 
    
    
}












