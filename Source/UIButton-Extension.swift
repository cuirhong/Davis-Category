//
//  UIButton-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/28.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

public extension UIButton
{
    convenience init(title: String?="",highTitle:String?=nil,selTitle:String?=nil, backgroundColor:UIColor?=nil,highlightedImage:UIImage?=nil, imageName: String?=nil,selImageName:String?=nil, backImageName:String?=nil,backImage:UIImage?=nil,backImageColor:UIColor?=nil, highlightedImageName:String?=nil,selBackImage:UIImage?=nil,selBackImageName:String?=nil,selBackImageColor:UIColor?=nil,cornerRadius:CGFloat?=nil, target: Any?=nil ,selector: Selector?=nil, font: UIFont?=nil, titleColor: UIColor?=nil,titleHighColor:UIColor?=nil, selTitleColor:UIColor?=nil) {
        self.init()
        if let imageN = imageName {
            setImage(UIImage(named:imageN), for: UIControl.State())
        }
        if let text = selTitle{
            setTitle(text, for: .selected)
        }
        if let hightext = highTitle{
        
            setTitle(hightext, for: .highlighted)
        }
        if let selImageN = selImageName{
            setImage(UIImage(named:selImageN), for: .selected)
        }
        if let backColor = backgroundColor{
           self.backgroundColor = backColor
        
        }
    
        if let newBackImageName = backImageName{
            setBackgroundImage(UIImage(named:newBackImageName), for: .normal)
        
        }
        if let hImage = highlightedImageName{
      
            let image = UIImage.getLocalImage(hImage)
            setImage(image, for: .highlighted)
        
        }
        if let image = highlightedImage{
        
            setBackgroundImage(image, for: .highlighted)
        }
        if let image = backImage{
            setBackgroundImage(image, for: .normal)
        }
        if let selImage = selBackImageName{
          
             setBackgroundImage(UIImage(named:selImage), for: .selected)
        }
        if let selImage = selBackImage{
             setBackgroundImage(selImage, for: .selected)
        }
        
        if let color = backImageColor{
        
            setBackgroundImage(UIImage.getImageWithColor(color: color), for: .normal)
        }
        
        if let color = selBackImageColor{
        
            setBackgroundImage(UIImage.getImageWithColor(color: color), for: .selected)
        }
        
        if let size = cornerRadius{
        
            layer.cornerRadius = size
            clipsToBounds = true
        }
        
        if let newFont = font {
         titleLabel?.font = newFont
        
        }
        if let newColor = titleColor {
            
            setTitleColor(newColor, for: .normal)
        }
       
        if let newTitle = title {
            setTitle(newTitle, for: UIControl.State()) 
        }
       
       
        if let sel = selector {
            addTarget(target, action: sel, for: .touchUpInside)
        }
        
        if let selColor = selTitleColor{
            
           setTitleColor(selColor, for: .selected)
        }
        
        if let color = titleHighColor{
             setTitleColor(color, for: .highlighted)
        
        }
        
       self.sizeToFit()
        
    }
    
    
    //MARK:- 设置按钮的图片和文字的位置
    func positionLabelRespectToImage( position: UIView.ContentMode,
                                      spacing: CGFloat,state:UIControl.State) {

        let imageView = UIImageView(image: self.image(for: state))
        let  imageSize = imageView.bounds.size
        let titleFont = self.titleLabel?.font!
        var title = ""
        if let text = self.titleLabel?.text{
          title = text
        }
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: titleSize.height, right: 0)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }

    
}
