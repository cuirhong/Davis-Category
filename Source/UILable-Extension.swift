//
//  UILable-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/28.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

public extension UILabel
{
    convenience init(text: String?,font: UIFont?, textColor: UIColor?,bgColor:UIColor?=nil,textAlignment:NSTextAlignment?=nil,lineMode:NSLineBreakMode?=nil,numLine:Int?=nil) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        
        if let alignment = textAlignment {
            self.textAlignment = alignment
        }
        
        if let mode = lineMode{
            lineBreakMode = mode
        }
        
        if let line = numLine{
            numberOfLines = line 
        }
        
        if bgColor != nil{
            backgroundColor = bgColor
        }
        self.sizeToFit()
    }
    
    
    /// 设置不同的文本
    func setDiffirentText(needText:String,systemfontSize:CGFloat?=nil,boldFontSize:CGFloat?=nil, fontName:String?=nil,fontColor:UIColor?=nil){
        let string = self.text ?? ""
        let attributedString = self.attributedText as? NSMutableAttributedString ?? NSMutableAttributedString.init(string: string)
        
        let range = (string as NSString).range(of: needText)
        
        var font:UIFont? = nil
        if let newSize = systemfontSize{
            font = UIFont.font(systemSize: newSize, fontName: fontName)
            
        }else if let boldSize = boldFontSize{
            
            font = UIFont.font(psboldSize: boldSize, fontName: fontName)
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
    func labelSize(text:String,size:CGSize?=nil, font:UIFont?) -> CGRect{
        var rect = CGRect();
        var newSize:CGSize = CGSize.init(width: 100000, height: 100000)
        if size != nil {
            newSize = size!
        }
        
        let attributes = [NSAttributedString.Key.font: font]//计算label的字体
        rect = text.boundingRect(with: newSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes as [NSAttributedString.Key : Any] , context: nil);
        return rect
    }
    
    //MARK:- 设置行间距
    func setLineSpace(lineSpace:CGFloat){
        
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













