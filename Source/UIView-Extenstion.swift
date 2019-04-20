//
//  UIView-Extenstion.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/8/18.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import UIKit

public extension UIView{

    /// 设置view的圆角
    @IBInspectable var dd_viewCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    /// 设置圆角的颜色
    @IBInspectable  var dd_viewBorderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    /// 圆角的宽
    @IBInspectable  var dd_viewBorderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    

    /// 设置view的某一个边角为圆角
    func dd_rectCorner(corner:UIRectCorner,radii:CGSize){
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: radii)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
    
        self.layer.mask = maskLayer
    }
    
    /// 初始化一个view
    convenience init(bgColor:UIColor?,corner:CGFloat=0){
        self.init(frame: CGRect.zero)
        backgroundColor = bgColor
        if corner > 0{
            dd_viewCornerRadius = corner
        }
    }
    
    /// 截取屏幕
    func screenshotToImage()->UIImage?{
        UIGraphicsBeginImageContext(bounds.size)
        if let content = UIGraphicsGetCurrentContext(){
            layer.render(in: content)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        return nil
      
    }
    

}














