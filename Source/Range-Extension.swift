//
//  Range-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/5/8.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

public extension NSRange{

   /// 获取某一个字符串在总字符串中的区间range
    static func range(allText:String,rangeText:String)->NSRange{
        let range:NSRange =  (allText as NSString).range(of:rangeText)
        
       return range

    }

}









