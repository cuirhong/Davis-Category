//
//  NSString-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/28.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit
import CommonCrypto
 
public extension String{
 
    ///获取本地文件的路径
    static func localPath(_ localFileName:String) -> String {
        if  let path = Bundle.main.path(forResource: localFileName, ofType: nil)  {
            return path;
        }
            return ""
    }
    
    
    /// md5加密 Int32位
    @available(*, deprecated, message: "即将过期,请使用md5For32Bate")
    func md5String() -> String{

        if let str = self.cString(using: String.Encoding.utf8){
            let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
            let digestLen = Int(CC_MD5_DIGEST_LENGTH)
            let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
            
            CC_MD5(str, strLen, result)
            
            let hash = NSMutableString()
            for i in 0..<digestLen {
                hash.appendFormat("%02x", result[i])
            }
            
            result.deallocate()
            
            return String(hash)
        }
    
        return ""
    }
    
    /// 32位MD5加密 isUpper:结果是否大写
    func md5For32Bate(isUpper:Bool=true)->String{
        return handerMD5(isUpper: isUpper)
    }
    
    /// 16位MD5加密 isUpper:结果是否大写
    func MD5For16Bate(isUpper:Bool=true)->String{
        return handerMD5(isUpper: isUpper, is32: false)
    }
    
    
    /// 统一处理md5
    private func handerMD5(isUpper:Bool,is32:Bool=true)->String{
        var md5String = ""
        if let str = self.cString(using: String.Encoding.utf8){
            let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
            let digestLen = Int(CC_MD5_DIGEST_LENGTH)
            let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
            
            CC_MD5(str, strLen, result)
            
            let hash = NSMutableString()
            for i in 0..<digestLen {
                hash.appendFormat("%02x", result[i])
            }
            result.deallocate()
            md5String = String(hash)
        }
        if is32 == false && md5String.getLenth() == 32{
            //16位的md5
            md5String = md5String.subString(start: 8, length: 16)
        }
        if isUpper == false{
            //如果是小写
            md5String = md5String.lowercased()
        }
        return md5String
    }
    
    /// 截取字符串
    func subString(start:Int, length:Int) -> String {
        if self.getLenth() < start + length{
            return self
        }
        
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
    
    /// 该方法即将过期，请使用 String.localCachePath
    @available(*, deprecated, message: "该方法即将过期，请使用 String.localCachePath")
    func cacheStr()->String{
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let filePath = (path as NSString).appendingPathComponent(self)
        return filePath
    }
    
    /// 获取本地缓存的地址
    static func localCachePath(fileName:String)->String{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let filePath = (path as NSString).appendingPathComponent(fileName)
        
        
        return filePath
    }
    
    /// 本地文件地址
    static func localDocumentPath(fileName:String)->String{
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                                FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let filePath = (documentPaths[0] as NSString).appendingPathComponent(fileName)
        return filePath
    }
    
    /// 该方法即将过期，请使用 String.localDocumentPath
    @available(*, deprecated, message: "即将过期,请使用String.localDocumentPath")
    func docStr()->String{
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                                FileManager.SearchPathDomainMask.userDomainMask, true)
       
        let filePath = (documentPaths[0] as NSString).appendingPathComponent(self)
        return filePath
    }
    
    
    @available(*, deprecated, message: "即将过期,请使用String.localTempPath")
    func tmpStr()->String{
        let path = NSTemporaryDirectory()
        let filePath = (path as NSString).appendingPathComponent(self)
        return filePath
    }
    
    /// 获取本地零时文件地址
    func localTempPath()->String{
        let path = NSTemporaryDirectory()
        let filePath = (path as NSString).appendingPathComponent(self)
        return filePath
    }

   
    /// 字符串得到Date
    static func getDateFromString(dateStr:String?="",formatter:String?="yyyy-MM-dd HH:mm:ss",isLocal:Bool=true)->Date?{
        let f = DateFormatter()
        f.dateFormat = formatter
        let date = f.date(from: dateStr!)
        
        if isLocal == true && date != nil{
            let interval = NSTimeZone.system.secondsFromGMT(for: date!)
            let localeDate = date?.addingTimeInterval(TimeInterval(interval))
            return localeDate
        }
        return date
    }
    
    /// 从Int获取星期几的字符串
   static func weekStringFromInt(date:Int)->String{
        switch date {
        case 2:
            return  "一"
        case 3:
            return "二"
        case 4:
            return "三"
        case 5:
            return "四"
        case 6:
            return "五"
        case 7:
            return "六"
        case 1:
            return "日"
            
        default:
            return "--"
        }
    
    }
 
    /// 从int转换成string
    static func getString(intData:Int?=nil,int64Data:Int64?=nil) -> String{
        if intData != nil{
            let string = String(format: "%d", intData ?? 0)
            return string
        }else{
            let string = String(format: "%d", int64Data ?? 0)
            return string
        }
    }
    
  
    /// 获取字符串的长度
     func getLenth()->Int{
     
        if  self.lengthOfBytes(using: String.Encoding.utf8) == 0{
         return 0
        }
    
        let string = NSString.init(string: self)
        return string.length
    
    }
    

    /// 去掉空格键
    func replace(preString:String,replaceString:String)->String{
        let string = (self as NSString).replacingOccurrences(of: preString, with: replaceString)
        return string
    }
    
    
 
    /// 比较时间   return 刚刚/几分钟前/几小时前/几天前...
    static func comparedDate(dateStr:String?=nil,dateFormatter:String?="yyyy-MM-dd HH:mm:ss",timeInterval:TimeInterval?=nil)->String{
         var date1 = Date()
        if  let formatter  = dateFormatter{
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = formatter
            
            if let date = newDateFormatter.date(from: dateStr ?? ""){
                date1 = date
            }
        }
        if let timeIn = timeInterval{
            date1 = Date(timeIntervalSince1970: timeIn)
        }
        let date2 = Date()
        let newTimeInterval = date2.timeIntervalSince(date1)
        var dateStr = ""
        if newTimeInterval <= 60{
          dateStr = "刚刚"
        }else if newTimeInterval < 60*60{
            let mins:Int = Int(newTimeInterval/60)
          dateStr = String(format: "%d分钟前", mins)
        }else if newTimeInterval < 60*60*24{
            let hour = Int(newTimeInterval/60/60)
            dateStr = String(format: "%d小时前", hour)
        }else if newTimeInterval < 60*60*24*4 {
            let day = Int(newTimeInterval/60/60/24)
            dateStr = String(format: "%d天前", day)
        }else {
            let com = date1.getDateComponents()
            let com2 = date2.getDateComponents()
            if let comYear = com.year , let com2Year = com2.year {
                if let monthSth = com.month,let dayStr = com.day, let hourStr = com.hour,let minuteStr = com.minute{
                    dateStr = String(format: "%02d月%02d日 %02d:%02d", monthSth,dayStr,hourStr,minuteStr)
                    if comYear != com2Year{//不是当年
                      dateStr = String(format: "%d年%@", comYear,dateStr)
                    }
                }
            }
        }
        return dateStr
    }
    
    
    /// 根据字符串得到controller
    func getController()->UIViewController?{
      
        if self.getLenth() == 0{
            return nil 
        }
        if let spaceName = Bundle.main.infoDictionary?["CFBundleExecutable"]{
            let className = (spaceName as! String) + "." + self
            let vcClass:AnyClass? = NSClassFromString(className)
            //告诉编译器实际的类型
            let trueClass = vcClass as? UIViewController.Type
            
           return trueClass?.init()
        }
        return nil
    }
    
    /// 是否是电话号码
    static func isPhoneNumber(_ phoneNum:String?)->Bool{
        if phoneNum == nil{
            return false
        }
       
        let scan = Scanner(string: phoneNum!)
        var intVar:Int = 0
        //是否是11位 是否都是数字 
        return phoneNum?.lengthOfBytes(using: String.Encoding.utf8) == 11 && scan.scanInt(&intVar) && scan.isAtEnd
    }
 
    
    /// 两个字符串是否相等
    static func isSameString(firstStr:String?,secondStr:String?)->Bool{
        if firstStr == nil || secondStr == nil{
            return false
        }

        if firstStr == secondStr{
            return true
        }
        
         return false
    }
    

}












