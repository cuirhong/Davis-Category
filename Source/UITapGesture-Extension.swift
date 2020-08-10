//
//  UITapGesture-Extension.swift
//  Intelligence
//
//  Created by cuirhong on 2017/10/18.
//  Copyright © 2017年 cuirhong. All rights reserved.
//

import Foundation
import UIKit

@objc extension UITapGestureRecognizer:UIGestureRecognizerDelegate{

    
   @objc convenience public  init(target:Any,selector:Selector) {
        self.init(target: target, action: selector)
        self.delegate = self
    }


    //解决手势与点击事件冲突
    @objc  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let view = touch.view{
            let string = NSStringFromClass(view.classForCoder)
            if string == "UITableViewCellContentView" || string == "UICollectionViewCellContentView"{
                
                return false //关闭手势
            }
            
        }
        // 存在手势
        return true
    }
 
}











