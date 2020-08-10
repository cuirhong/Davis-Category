//
//  UILable-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/28.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UILabel
{
    @objc convenience init(text: String?,font: UIFont?, textColor: UIColor?,bgColor:UIColor?=nil,textAlignment:NSTextAlignment = .left,lineMode:NSLineBreakMode = NSLineBreakMode.byTruncatingTail,numLine:Int = 0) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        
        self.textAlignment = textAlignment
        lineBreakMode = lineMode
        numberOfLines = numLine
        if bgColor != nil{
            backgroundColor = bgColor
        }
        self.sizeToFit()
    }
    
    
    /// 设置不同的文本
    @objc func setDiffirentText(needText:String,systemfontSize:Float=0.0,boldFontSize:Float=0.0, fontName:String?=nil,fontColor:UIColor?=nil){
        let string = self.text ?? ""
        let attributedString = self.attributedText as? NSMutableAttributedString ?? NSMutableAttributedString.init(string: string)
        
        let range = (string as NSString).range(of: needText)
        
        var font:UIFont? = nil
        if systemfontSize > 0{
            font = UIFont.font(systemSize: CGFloat(systemfontSize), fontName: fontName)
            
        }else if boldFontSize > 0{
            
            font = UIFont.font(psboldSize: CGFloat(boldFontSize), fontName: fontName)
        }
        
        if let newFont = font{
            attributedString.addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
        }
        if let color = fontColor{
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        self.attributedText = attributedString
    }
    
    
    ///  计算label的宽度和高度 size是自己label的size(一般只固定一个宽或高,计算另外一个)
    @objc func labelSize(text:String,size:CGSize=CGSize.zero, font:UIFont?) -> CGRect{
        var rect = CGRect();
        var newSize:CGSize = CGSize.init(width: 100000, height: 100000)
        if size != CGSize.zero {
            newSize = size
        }
        
        let attributes = [NSAttributedString.Key.font: font]//计算label的字体
        rect = text.boundingRect(with: newSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes as [NSAttributedString.Key : Any] , context: nil);
        return rect
    }
    
    //MARK:- 设置行间距
    @objc  func setLineSpace(lineSpace:CGFloat){
        
        let attrStrig = (self.attributedText as? NSMutableAttributedString) ??  NSMutableAttributedString(string: text ?? "")
        
        let attributedString:NSMutableAttributedString = attrStrig
        
        let paragraphStye = NSMutableParagraphStyle()
        
        //调整行间距
        let string = attributedText?.string ?? text
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength((string ?? "") as CFString))
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStye, range: rang)
        self.attributedText = attributedString
    }
    
}













