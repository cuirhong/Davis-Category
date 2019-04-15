//
//  UITextView-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/28.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

var kPlaceholderLabelPointer:UInt8=0
/// 扩展textView的placeholder属性
public extension UITextView {
    convenience init(text:String,font:UIFont?=nil, textColor:UIColor?=nil,backColor:UIColor?=nil,placeholderStr:String?=nil,placeholderColor:UIColor?=nil,placeholderFont:UIFont?=nil) {
        self .init()
        self.text = text
        self.font = font
        self.textColor = textColor
        
        if let color = backColor{
            backgroundColor = color
        }
        
        if placeholderStr?.lengthOfBytes(using: String.Encoding.utf8) ?? 0 > 0{
            setPlaceHolder(placeHolderStr: placeholderStr, textColor: placeholderColor, placeholderFont: placeholderFont)
        }
    }
 
   private var placeHolderTextView:UITextView? {
        get{
            return objc_getAssociatedObject(self,&kPlaceholderLabelPointer)as?UITextView
        }
        set{
            objc_setAssociatedObject(self, &kPlaceholderLabelPointer, newValue,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 设置占位文本的信息
    func setPlaceHolder(placeHolderStr:String?,textColor:UIColor?=nil,placeholderFont:UIFont?=nil) {
        
        if placeHolderTextView==nil{
            
            placeHolderTextView = UITextView(frame:self.bounds)
            
            placeHolderTextView?.isUserInteractionEnabled=false
            
            placeHolderTextView?.text = placeHolderStr
            
            placeHolderTextView?.textColor = textColor
            
            placeHolderTextView?.font = placeholderFont ?? self.font
            
            placeHolderTextView?.backgroundColor = UIColor.clear
            
            self.insertSubview(placeHolderTextView!, at:0)
            
        }
        
    }
    
    /// 有时候setText不是特别灵敏，可以调用此方法重置placeholder和text的关系
    func dd_setText(_ newText:String?){
        self.text = newText
        if text.lengthOfBytes(using: String.Encoding.utf8) > 0 {
            self.placeHolderTextView!.isHidden=true
        }else{
            placeHolderTextView!.isHidden=false
        }
    }
    
    
    override  open func willMove(toSuperview newSuperview:UIView?) {
            NotificationCenter.default.addObserver(self,
        
                                                   selector:#selector(didChange(notification:)),
        
                                                   name:UITextView.textDidChangeNotification,
        
            object:nil)
        
    }
    
    @objc func didChange (notification:NSNotification) {
        guard placeHolderTextView != nil else {
            return
        }
        if ((notification.object as? UITextView) != nil){
            dd_setText(self.text)
        }
    }
    
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        placeHolderTextView?.frame = self.bounds
    }
}




