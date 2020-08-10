//
//  UISlider-Extension.swift
//  OurVillages
//
//  Created by Davis on 2019/3/5.
//  Copyright © 2019 深圳市昊昱显信息技术有限公司. All rights reserved.
//

import Foundation
import UIKit

@objc public extension UISlider{
   @objc convenience init(maximumValue:Float=1.0,minimumValue:Float=0.0,currentValue:Float=0.0,target: Any?=nil ,selector: Selector?=nil) {
        self.init()
        self.maximumValue = maximumValue
        self.minimumValue = minimumValue
        self.value = currentValue
        if let newTarget = target,let newSelector = selector {
            self.addTarget(newTarget, action: newSelector, for: .valueChanged)
        }
    }
    
}


