//
//  NSMutableAttributedString-Extension.swift
//  Intelligence
//
//  Created by cuirhong on 2017/11/7.
//  Copyright © 2017年 cuirhong. All rights reserved.
//

import Foundation
import UIKit
@objc public extension NSMutableAttributedString{
    
    /// 设置不同的文本
    @objc func getDiffirentText(needText:String,font:UIFont,fontColor:UIColor?=nil)->NSMutableAttributedString{
        if string.contains(needText){
            let range = (string as NSString).range(of: needText)
            self.addAttribute(NSAttributedString.Key.font, value:font, range: range)
            if let color = fontColor{
                self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            }
        }
        return self
    }
    
    
   @objc convenience init(string:String?,lineSpacing:CGFloat=0,font:UIFont=UIFont.systemFont(ofSize: 15)){
        let parahp = NSMutableParagraphStyle()
        parahp.lineSpacing = lineSpacing
        parahp.lineBreakMode = .byTruncatingTail
        self.init(string: string ?? "", attributes: [NSAttributedString.Key.font:font,NSAttributedString.Key.paragraphStyle:parahp])
    }
   
}






