//
//  Date-Extension.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/3/8.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit

@objc public extension NSDate{
    
    
    //MARK:- 获取当前时间
    static func currentDate(isLoale:Bool=true)->Date{
        return Date.currentDate(isLoale: isLoale)
    }
    
    
    // 获取日期是星期几
    @objc func getDateWeekDay(dateFormaterString:String="yyyy-MM-dd HH:mm:ss") ->Int {
        return (self as Date).getDateWeekDay(dateFormaterString: dateFormaterString)
    }
    
    //MARK:- 根据北京时间获取当地时间,国外也适用,适配跨国时间
    static func loacalDate(formBeijingTimeinteval:TimeInterval,dataFormatter:String="yyyy-MM-dd HH:mm:ss")->DateComponents?{
        return Date.loacalDate(formBeijingTimeinteval: formBeijingTimeinteval, dataFormatter: dataFormatter)
    }
    
    //MARK:- 获取时间的一个机构体
    @objc func getDateComponents() -> DateComponents {
        return (self as Date).getDateComponents()
    }
 
    //MARK:- 时间间隔
    static func dateInterval(date1:Date,date2:Date) -> DateComponents{
        return Date.dateInterval(date1: date1, date2: date2)
    }
    
    //MARK:- 是否是同一天
    static func isSameDate(dateString:String?,date2String:String?,dateFormatter:String?="yyyy-MM-dd HH:mm:ss")->Bool{
        return Date.isSameDate(dateString: dateString, date2String: date2String,dateFormatter: dateFormatter)
    }
    
    
    
    //MARK:- 获取时间从时间戳
    static func getDateString(fromTimeInterval:TimeInterval,formatter:String?=nil)->String{
        return Date.getDateString(fromTimeInterval: fromTimeInterval, formatter: formatter).1
    }
    
    
    //MARK:- 获取当前时间戳
    static func getCurrentTimeInterval()->TimeInterval{
        return Date.getCurrentTimeInterval()
    }
}









public extension Date{
    enum DD_DateType {
        case Unkwon;
        case Yesterday //昨天
        case Today //今天
        case Tomorrow // 明天
        case CurrentYear//今年
        case ThisWeek//这个星期
        case UnTodyYear//非今年
    }

    //MARK:- 获取当前时间
    static func currentDate(isLoale:Bool=true)->Date{
        let date = Date()
        if isLoale{
            let interval = NSTimeZone.system.secondsFromGMT(for: date)
            let localeDate = date.addingTimeInterval(TimeInterval(interval))
            return localeDate
            
        }
        return date
    }
    
    
    // 获取日期是星期几
    func getDateWeekDay(dateFormaterString:String="yyyy-MM-dd HH:mm:ss") ->Int {
        
        let dateFmt         = DateFormatter()
        
        dateFmt.dateFormat  = dateFormaterString
        
        let interval        = Int(self.timeIntervalSince1970)
        
        let days            = Int(interval/86400)
        
        let weekday         = ((days + 4)%7+7)%7
        
        return weekday
        
    }
    
    
    
    
    
    //MARK:- 根据北京时间获取当地时间
    static func loacalDate(_ fromBeijingTimeStr:String?=nil,formBeijingTimeinteval:TimeInterval?=nil,dataFormatter:String="yyyy-MM-dd HH:mm:ss")->DateComponents?{
        //北京时间与当地时间转换
        
        //北京时间转换成格林尼治时间
        var date:Date?=nil
        if fromBeijingTimeStr != nil{
            date = String.getDateFromString(dateStr: fromBeijingTimeStr, formatter: dataFormatter, isLocal: true)?.addingTimeInterval(-8*60*60)
        }
        
        if let fromTimeInterval = formBeijingTimeinteval{
            date = Date(timeIntervalSince1970: fromTimeInterval)
        }
        
        var calendar: Calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = NSTimeZone.system //这里会把格林尼治时间自动转换成本地时间
        if let newDate = date{
            let comps: DateComponents = calendar.dateComponents([.year,.month,.day, .weekday, .hour, .minute,.second,.calendar], from: newDate)
            
            return comps
        }
        
        return nil
    }
    
    
    
    
    
    //MARK:- 获取时间的一个机构体
    func getDateComponents() -> DateComponents {
        
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = calendar.dateComponents([.year,.month,.day, .weekday, .hour, .minute,.second], from: self)
        
        return comps;
    }
    
    
    //MARK:- 比较时间
    func comparedDateWithCurrentDate()->DD_DateType{
        let calendar = Calendar.current
        
        let isTody = calendar.isDateInToday(self)
        if isTody {
            return .Today
        }
        
        let isYesterdy = calendar.isDateInYesterday(self)
        if isYesterdy{
            return .Yesterday
        }
        
        let isTomorrow = calendar.isDateInTomorrow(self)
        if isTomorrow{
            return .Tomorrow
        }
        
        let isCurrentYear = self.getDateComponents().year == (Date.currentDate()).getDateComponents().year
        if isCurrentYear{
            return .CurrentYear
        }
        
        let isThisWeek = calendar.isDateInWeekend(self)
        if isThisWeek{
            return .ThisWeek
        }
        
        return .Unkwon
    }
    
    
    //MARK:- 时间间隔
    static func dateInterval(date1:Date,date2:Date) -> DateComponents{
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let result = gregorian?.components([NSCalendar.Unit.day,NSCalendar.Unit.hour,NSCalendar.Unit.minute], from: date1, to: date2)
        guard result == nil else {
            return result!
        }
        return DateComponents.init()
    }
    
    //MARK:- 是否是同一天
    static func isSameDate(dateString:String?,date2String:String?,dateFormatter:String?="yyyy-MM-dd HH:mm:ss")->Bool{
        
        let date1 = String.getDateFromString(dateStr: dateString, formatter: dateFormatter)
        let date2 = String.getDateFromString(dateStr: date2String, formatter: dateFormatter)
        if date1 == nil || date2 == nil {
            
            
        }
        if let dateOne = date1,let dateTow = date2{
            if Calendar.current.isDate(dateOne, inSameDayAs: dateTow){
                
                return true
            }
        }
        
        return false
        
    }
    
    
    
    //MARK:- 获取时间从时间戳
    static func getDateString(fromTimeInterval:TimeInterval,formatter:String?=nil)->(Date,String){
        let date = Date(timeIntervalSince1970: fromTimeInterval)
        var string:String = ""
        if formatter != nil{
            let dformatter = DateFormatter()
            dformatter.dateFormat = formatter
            string = dformatter.string(from: date)
        }
        return (date,string)
    }
    
    
    //MARK:- 获取当前时间戳
    static func getCurrentTimeInterval()->TimeInterval{
        let timeInterval = Date().timeIntervalSince1970
        return TimeInterval(timeInterval * 1000) //精确到毫秒
    }
    
}











