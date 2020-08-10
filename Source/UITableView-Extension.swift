//
//  UITableView-Extension.swift
//  Davis-Category-demo
//
//  Created by cuirhong on 2020/8/6.
//  Copyright © 2020 cuirhong. All rights reserved.
//

import Foundation
import UIKit
@objc public extension UITableView{
    
    //MARK:- 数据是否有改变
    @objc var dataHasChanged: Bool {
        guard let dataSource = dataSource else { return false }
        let sections = dataSource.numberOfSections?(in: self) ?? 0
        if numberOfSections != sections {
            return true
        }
        for section in 0..<sections {
            if numberOfRows(inSection: section) != dataSource.tableView(self, numberOfRowsInSection: section) {
                return true
            }
        }
        return false
    }
    
    //MARK:- 安全刷新数据
    // 这里直接reloadData，当数据没有发生变化的时候，会偶现奔溃bug，有点奇怪
    /**奔溃日志
     Invalid update: invalid number of sections. The number of sections contained in the table view after the update (1) must be
     */
    @objc  func safeRealodData(){
        if(dataHasChanged){
            reloadData()
        }else{
            reloadRows(at: getVisibleCellIndexPaths(), with: .none)
        }
    }
    
    //MARK:- 获取可见的cell
    @objc func getVisibleCellIndexPaths()->[IndexPath]{
        var mutableArray:[IndexPath] = []
        for cell in visibleCells {
            let tempIndexPath = indexPath(for: cell);
            if let indexPath = tempIndexPath{
              mutableArray.append(indexPath)
            }
        }
        return mutableArray
    }
    
    //MARK:- 获取可见的分区
    @objc func getVisibleSections()->NSMutableSet{
        let visibleCellIndexPaths = getVisibleCellIndexPaths()
        let mutableSet:NSMutableSet = NSMutableSet()
        for indexPath in visibleCellIndexPaths{
            mutableSet.add(indexPath.section)
        }
        return mutableSet
    }
    
}
