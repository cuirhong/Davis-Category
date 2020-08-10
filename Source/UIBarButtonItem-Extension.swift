//
//  UIBarButtonItem-Extension.swift
//  QiuGuo
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UIBarButtonItem {
    
   @objc convenience init(imageName : String, highlightedImage : String? = "" , size : CGSize = CGSize.zero, target:UIViewController? = nil, action:Selector?=nil) {
        let btn = UIButton()
        btn.setImage(UIImage(named : imageName), for: .normal)
        if highlightedImage != ""{
            btn.setImage(UIImage(named : highlightedImage!), for: .highlighted)
        }
        if size != CGSize.zero{
            btn.frame = CGRect (origin: CGPoint.zero, size: size)
        }else
        {
            btn.sizeToFit()
        }
        if target != nil,action != nil{
          btn.addTarget(target, action: action!, for: .touchUpInside)
        }
      
        self.init(customView: btn)
    }
    
    
    /// 创建返回按钮(返回按钮经常太小了)
    static func createNaviBackButton(imgName:String?=nil,title:String?=nil,target:Any,selector:Selector)->UIBarButtonItem{
        let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        backBtn.backgroundColor = UIColor.red
        if let name = imgName{
             backBtn.setImage(UIImage(named: name), for: .normal)
        }
        if let title = title{
             backBtn.setTitle(title, for: .normal)
        }
       
        backBtn.addTarget(target, action: selector, for: .touchUpInside)
        return UIBarButtonItem.init(customView: backBtn)
    }
    
    
    
}
