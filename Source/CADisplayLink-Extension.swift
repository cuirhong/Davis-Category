//
//  CADisplay-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/6/22.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import UIKit

@objc public extension CADisplayLink{
 
    class func displayLink(target:Any,selector:Selector,second:Int,isPause:Bool=false)->CADisplayLink{
        let link = CADisplayLink(target: target, selector: selector)
        if #available(iOS 10.0, *){
            link.preferredFramesPerSecond = second
        }else{
            link.frameInterval = second
        }
        link.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
      
        link.isPaused = isPause
        return link
    }


}








