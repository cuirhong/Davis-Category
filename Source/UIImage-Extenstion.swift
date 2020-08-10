//
//  UIImage-Extenstion.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/3.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension UIImage{
    
    //MARK:- 获取图片
    class  func getLocalImage(_ imageName:String?) -> UIImage? {
        var name = imageName ?? ""
        if name.hasSuffix(".png") == false , name.hasSuffix(".jpg") == false{
            name = name + ".png"
        }
        if let image = UIImage(contentsOfFile: String.localPath(name)){
            return image
        }else{
            if let image =  UIImage(named: name) {
                return image
            }
            if let image =  UIImage(named: name) {
                return image
            }
        }
        return nil
    }
    
 
    //MARK:- 压缩图片
    class func scaleImage(_ image:UIImage,toKb:Int)->Data?{
        
        let targetByte = toKb * 1000
        var compression:CGFloat = 1.0
        let maxCompression:CGFloat = 0.1
        if
            let imageData = image.jpegData(compressionQuality: compression){
            if toKb < 1{
                return imageData
            }
            
            var newImageData:Data? = imageData
            while (newImageData?.count)! > targetByte && compression > maxCompression {
                compression -= 0.1
                newImageData = image.jpegData(compressionQuality: compression)
            }
            
            return newImageData
        }
        return nil
    }
    
    class func getImage(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    
    //MARK:- 反转图片
   @objc func flipImage(orientation:UIImage.Orientation)->UIImage? {
        
        
        var bounds = CGRect.zero
        var image:UIImage? = nil
        var contextRef:CGContext? = nil
        let imageRef = self.cgImage
        var rect = CGRect.zero
        var transform:CGAffineTransform = CGAffineTransform.identity
        
        rect.size.width = CGFloat(imageRef?.width ?? 0)
        rect.size.height = CGFloat(imageRef?.height ?? 0)
        
        bounds = rect
        
        
        
        switch orientation {
        case .up:
            return self;
        case .upMirrored:
            transform = CGAffineTransform(translationX: rect.size.width, y: 0)
            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
        case .down:
            transform = CGAffineTransform(translationX: rect.size.width, y: rect.size.height)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        case .downMirrored:
            transform = CGAffineTransform(translationX: 0.0, y: rect.size.height)
            transform = CGAffineTransform(scaleX: 1.0, y: -1.0)
        case .left:
            bounds = swapWidthAndHeight(rect: bounds)
            transform = CGAffineTransform(translationX: 0, y: rect.size.width)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 3 * 0.5))
        case .leftMirrored:
            bounds = swapWidthAndHeight(rect: bounds)
            transform = CGAffineTransform(translationX: rect.size.height, y: rect.size.width)
            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 3 * 0.5))
        case .right:
            bounds = swapWidthAndHeight(rect: bounds)
            transform = CGAffineTransform(translationX: rect.size.height, y: 0)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.5))
        case .rightMirrored:
            bounds = swapWidthAndHeight(rect: bounds)
            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.5))
        default:
            break
        }
        
        UIGraphicsBeginImageContext(bounds.size)
        contextRef = UIGraphicsGetCurrentContext()
        switch orientation {
        case .left:
            fallthrough
        case .leftMirrored:
            fallthrough
        case .right:
            fallthrough
        case .rightMirrored:
            contextRef!.scaleBy(x: -1.0, y: 1.0)
            contextRef!.translateBy(x: -rect.size.height, y: 0.0)
        default:
            contextRef!.scaleBy(x: 1.0, y: -1.0)
            contextRef!.translateBy(x:0 , y: -rect.size.height)
            break
        }
        
        
        contextRef!.concatenate(transform)
        UIGraphicsGetCurrentContext()?.draw(imageRef!, in: rect)
        
        
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image
        
        
    }
    
    
    /** 交换宽和高 */
    fileprivate func swapWidthAndHeight(rect:CGRect)->CGRect{
        var newRect = rect
        let swap = rect.size.width
        newRect.size.width = rect.size.height
        newRect.size.height = swap
        return rect
        
    }
    
    
    
    //MARK:- 根据一张图片获取一定大小的图片
    class func cutImage(image:UIImage,size:CGSize,alpha:CGFloat = 1)->UIImage{
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        UIGraphicsGetCurrentContext()?.setAlpha(alpha)
        let newImage:UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? image
    }
    
}








