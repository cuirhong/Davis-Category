//
//  PHAsset-Extentsion.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/6/20.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import Foundation
import Photos

@objc public extension PHAsset{
    /// 获取图片
   @objc func getImageDataFromAsset(num:Int,completion:@escaping (_ data: Data?,_ requestImageID:String?,_ num:Int) -> Void){
        
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.isNetworkAccessAllowed = true
        options.isSynchronous = false
        manager.requestImageData(for: self, options: options) { (result, string, orientation, info) -> Void in
            if let imageData = result {
                completion(imageData,string,num)
            } else {
                completion(nil,nil,num)
            }
        }
        
    }
}









