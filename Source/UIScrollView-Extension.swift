//
//  UIScrollView-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/6/16.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import UIKit

@objc public extension UIScrollView{
    
   @objc convenience init(frame:CGRect=CGRect.zero,showsVerticalScrollIndicator:Bool=true,showsHorizontalScrollIndicator:Bool=true,isPage:Bool=false){
        
        self.init(frame: frame)
        
        isPagingEnabled = isPage
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        
    }
    
 
}





