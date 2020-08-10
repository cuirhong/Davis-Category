//
//  UINavigationBar-Extenstion.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/6/7.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UINavigationBar{
    
    private struct NavigationBarKeys{
        static var overlayKey = "overlayKey"
    }
    
    private var overlay:UIView?{
        get{
            return objc_getAssociatedObject(self, &NavigationBarKeys.overlayKey) as? UIView
        }
        set{
            objc_setAssociatedObject(self, &NavigationBarKeys.overlayKey, newValue as UIView?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    
    
    /// 设置导航栏的背景颜色
    @objc  func nav_setBackgroundColor(backgroundColor:UIColor,isSetStatus:Bool=true){
        if overlay == nil{
            
            var frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            if isSetStatus{
                
                frame = CGRect(x: 0, y: -20, width: bounds.width, height: bounds.height + 20)
            }
            overlay = UIView(frame: frame)
            overlay?.isUserInteractionEnabled = false
            overlay?.autoresizingMask  = UIView.AutoresizingMask.flexibleWidth
            
        }
        
        tintColor = UIColor.clear
        
        overlay?.backgroundColor = backgroundColor
        insertSubview(overlay!, at: 0)
        
    }
    
    
    
    ///
    @objc  func nav_setTranslationY(translationY:CGFloat){
        transform = CGAffineTransform(translationX: 0, y: translationY)
    }
    
    
    ///设置导航栏子元素的透明度
    @objc func nav_setElementsAlpha(alpha:CGFloat){
        
        for (_,element) in subviews.enumerated() {
            if element.isKind(of: NSClassFromString("UINavigationItemView") as! UIView.Type) || element.isKind(of: NSClassFromString("UINavigationButton") as! UIButton.Type) || element.isKind(of: NSClassFromString("UINavBarPrompt") as! UIView.Type){
                element.alpha = alpha
                
                
            }
            
            if element.isKind(of: NSClassFromString("_UINavigationBarBackIndicatorView") as! UIView.Type){
                
                element.alpha = element.alpha == 0 ? 0: alpha
                
            }
        }
        
        //
        items?.forEach({ (item) in
            if let titleView = item.titleView{
                titleView.alpha = alpha
                
                
            }
            
            
            for BBItems in [item.leftBarButtonItems,item.rightBarButtonItems]{
                
                BBItems?.forEach({ (barButtonItem) in
                    if let customView = barButtonItem.customView{
                        customView.alpha = alpha
                        
                    }
                })
            }
        })
    }
    
    /// viewWillDisAppear调用
    @objc func navi_reset(){
        setBackgroundImage(nil, for: .default)
        overlay?.removeFromSuperview()
        overlay  = nil  
    }
    
    
    
}






