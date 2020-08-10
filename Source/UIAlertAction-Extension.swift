//
//  UIAlertAction-Extension.swift
//  Davis-Categoty-Demo
//
//  Created by cuirhong on 2019/4/15.
//  Copyright © 2019 davis. All rights reserved.
//

import Foundation
import UIKit
@objc public extension UIAlertAction{
    
   @objc convenience init(title:String?,image:UIImage?=nil, titleColor:UIColor?=nil,style:UIAlertAction.Style,handler:((UIAlertAction) -> Void)? = nil,isEnabled:Bool=true) {
        self.init(title: title, style: style, handler: handler)
        
        if let image = image{
           setValue(image, forKey: "image")
        }
 
        if let color = titleColor{
           setValue(color, forKey: "titleTextColor")
        }
        
        
    }
    
    
   
    
    
}
