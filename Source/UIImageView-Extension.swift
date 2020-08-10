//
//  UIImageView-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/3.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UIImageView{
    
    // MARK:设置圆角图片,image必须不为空才有效
    @objc func setCornerRadius(){
        if self.image == nil{
            return
        }
        
        if self.bounds.size == CGSize.zero{
            return
        }
        
        DispatchQueue.main.async {[weak self] in
            guard let `self` = self else {
                return
            }
            //开始图形上下文
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
            //获取图形上下文
            let ctx = UIGraphicsGetCurrentContext()
            //根据一个rect创建一个椭圆
            ctx?.addEllipse(in: self.bounds)
            //裁剪
            ctx?.clip()
            
            
            //将原照片画到图形上下文
            self.image?.draw(in: self.bounds)
            //从上下文上获取剪裁后的照片
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            //关闭上下文
            UIGraphicsEndImageContext()
            
            self.image = newImage
            
        }
    }
    
}





