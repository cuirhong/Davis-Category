//
//  UIFont-Extentsion.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/3.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

//根据不同屏幕的大小放大缩小整体的字体大小
var fontSizeChangeNum:CGFloat = -1

@objc public extension UIFont{
    class func getFont(systemSize:Float,weight:UIFont.Weight)->UIFont{
        initChangeFontSize()
        let size = CGFloat(systemSize) - fontSizeChangeNum
        var font:UIFont? = nil
        if #available(iOS 8.2, *), weight.rawValue > 0 {
            font = UIFont.systemFont(ofSize: size, weight: weight)
        } else {
            font = UIFont.systemFont(ofSize: size)
        }
        return font!
    }
}

public extension UIFont{
    
    ///初始化一下字体改变
    class func initChangeFontSize() {
        if fontSizeChangeNum == -1{
            fontSizeChangeNum = 0
            if UIScreen.main.bounds.height < 568{
                fontSizeChangeNum = 2
            }else if UIScreen.main.bounds.height < 667{
            }else if UIScreen.main.bounds.height > 667{
                fontSizeChangeNum = -0.5
            }
        }
    }
    
     /// 字体转换为实际字体(psFontSize是ps的字体大小转换为iOS大小)
    class func font(systemSize:CGFloat?=nil,weight:UIFont.Weight?=nil,systemBoldSize:CGFloat?=nil, psFontSize:CGFloat?=nil,psboldSize:CGFloat?=nil, fontName:String?=nil,fontFimalyName:String?=nil)->UIFont{
        var size:CGFloat = 15
        if systemBoldSize != nil{
            size = systemBoldSize ?? 15
        }
        if systemSize != nil{
            size = systemSize ?? 15
        }else{
            if let newSize = psboldSize ?? psFontSize{
                size = newSize/2
                size = size / 96 * 72
            }
        }
        
       initChangeFontSize()
        
        size = size - fontSizeChangeNum
        
        if fontName != nil{
            let fontDescriptor = UIFontDescriptor.init(fontAttributes: [UIFontDescriptor.AttributeName.family:fontFimalyName ?? "",UIFontDescriptor.AttributeName.name:fontName ?? "",UIFontDescriptor.AttributeName.size:size])
            let font = UIFont.init(name: fontName ?? "", size: size) ?? UIFont.init(descriptor: fontDescriptor, size: size)
            return font
        }else{
            var font:UIFont? = nil
            if psboldSize != nil || systemBoldSize != nil {
            
                font = UIFont.boldSystemFont(ofSize: size)
            }else{
                if let newWeight = weight{
                    if #available(iOS 8.2, *) {
                        font = UIFont.systemFont(ofSize: size, weight: newWeight)
                    } else {
                        font = UIFont.systemFont(ofSize: size)
                       
                    }
                }else{
                    font = UIFont.systemFont(ofSize: size)
                }
            }
            return font!
        }
        
    }
 
}







