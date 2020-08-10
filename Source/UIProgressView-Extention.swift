//
//  UIProgressView-Extention.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/5/5.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UIProgressView{

   @objc convenience init(frame: CGRect=CGRect.zero,bgColor:UIColor=UIColor.clear, tackColor:UIColor=UIColor.gray,progressColor:UIColor=UIColor.orange,progressValue:Float=0.0) {
        self.init(frame:frame)
        trackTintColor = tackColor
        progressTintColor = progressColor
        backgroundColor = bgColor
        progress = progressValue
    }
 
}
