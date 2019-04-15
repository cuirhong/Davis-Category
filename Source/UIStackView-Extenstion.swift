//
//  UIStackView-Extenstion.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/5/5.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public extension UIStackView{
 
    //MARK:- 创建stackView
    convenience init(axis:NSLayoutConstraint.Axis = .horizontal, spacing:CGFloat=0, distribution: UIStackView.Distribution = .fillEqually,stackSubViews:[UIView]=[]){
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.distribution = .fillEqually//子视图填充空白区域并等分
        for view in stackSubViews {
            addArrangedSubview(view)
        }
        
    }
}




