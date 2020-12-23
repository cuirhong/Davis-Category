//
//  UICollectionView-Extension.swift
//  Davis-Category-Demo
//
//  Created by davis on 2020/12/23.
//  Copyright © 2020 cuirhong. All rights reserved.
//

import UIKit
@objc public extension UICollectionView{
    
    //MARK:- 数据是否有改变
    @objc var dataHasChanged: Bool {
        guard let dataSource = dataSource else { return false }
        let sections = dataSource.numberOfSections?(in: self) ?? 0
        if numberOfSections != sections {
            return true
        }
        for section in 0..<sections {
            if numberOfItems(inSection: section) != dataSource.collectionView(self, numberOfItemsInSection: section) {
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
    @objc  func safeReloadData(){
        DispatchQueue.main.async(execute: { [weak self] in
            guard let weakSelf = self else{
                return
            }
            if(weakSelf.dataHasChanged){
                weakSelf.reloadData()
            }else{
                weakSelf.reloadItems(at:  weakSelf.getVisibleCellIndexPaths())
            }
        })
       
    }
    
    //MARK:- 主线程刷新tableView
    @objc func mainQueueReloadData() {
        DispatchQueue.main.async(execute: { [weak self] in
            self?.reloadData()
        })
    }

    //MARK:- 获取可见的cellIndexPath
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
