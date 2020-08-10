//
//  UIAlertController-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/2.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UIAlertController{
  
    class func alert(title:String?,message:String,style:UIAlertController.Style,doneTitle:String, doneAction:((UIAlertAction) -> Swift.Void)? = nil,cancelTitle:String?=nil, cancelAction: ((UIAlertAction) -> Swift.Void)? = nil,destruectiveTitle:String?=nil, destructiveAction:((UIAlertAction) -> Swift.Void)? = nil)->UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
       
        if  doneTitle.lengthOfBytes(using: String.Encoding.utf8) >= 0{
            let done = UIAlertAction(title: doneTitle, style: .default, handler: doneAction)
            alertController.addAction(done)
        }
        
        
        if cancelTitle?.lengthOfBytes(using: String.Encoding.utf8) ?? 0 > 0{
            let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction)
            
            alertController.addAction(cancel)
        }
       
        if  destruectiveTitle?.lengthOfBytes(using: String.Encoding.utf8) ?? 0 > 0{
        
            let destruective = UIAlertAction(title: destruectiveTitle, style: .destructive , handler: destructiveAction)
            alertController.addAction(destruective)
        }
       
        
        return alertController
   
    }
    
    class func alert(title:String?,message:String?,style:UIAlertController.Style,actions:[UIAlertAction]?)->UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
       
        for action in actions! {
             alertController.addAction(action)
        }
        
        return alertController
        
    }


    //MARK:- 设置alert中的title字体颜色
    class func setActionTitle(actions:[UIAlertAction],color:UIColor){
        for action in actions {
            action.setValue(color, forKey: "titleTextColor")
            
        }
    }
    
    //MARK:- 修改title的颜色
   @objc  func changeTitle(color:UIColor?=nil,font:UIFont?=nil){
        
        let alertControllerStr = NSMutableAttributedString(string: title ?? "")
         let range = NSMakeRange(0, NSString.init(string: title ?? "").length)
        if let titleColor = color{
            alertControllerStr.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor, range:range)
        }
        
        if let titleFont = font{
            alertControllerStr.addAttribute(NSAttributedString.Key.font, value: titleFont, range:range)
        
        }
        let key = "attributedTitle"
        
        setValue(alertControllerStr, forKey: key)
    
    }
    
    
    //MARK:- 修改message
   @objc func changeMessage(color:UIColor?=nil,font:UIFont?=nil){
    
        let alertControllerStr = NSMutableAttributedString(string: message ?? "")
        let range = NSMakeRange(0, NSString.init(string: message ?? "").length)
        if let titleColor = color{
            alertControllerStr.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor, range:range)
        }
        
        if let titleFont = font{
            alertControllerStr.addAttribute(NSAttributedString.Key.font, value: titleFont, range:range)
            
        }
        let key = "attributedMessage"

        setValue(alertControllerStr, forKey: key)
   
    }
}
