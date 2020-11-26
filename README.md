# Davis-Category
根据多年项目经验，封装了很多项目中常用的工具，增加日后项目开发效率

## 接入使用
在Pofile文件中添加
```ruby
pod 'Davis-Category', '1.0.0'
```
执行pod install
```ruby
pod install
```
## 文件介绍
- [UITableView-Extension](#tableview)
- [Date-Extension](#date)

## <span id='tableview'>UITableView-Extension</span>
### 判断tableView数据是否发生改变
```swift
//section和row的数量是否发生改变
tableView.dataHasChanged
```
### 安全刷新
```swift
tableView.safeReloadData()
```
> 多项目经验，如果直接使用reloadData，当数据没有发生变化的时候，会偶现奔溃，奔溃日志如下：
> ```swift
>  Invalid update: invalid number of sections. The number of sections contained in the table view after the update (1) must be
> ```
### 获取可见的IndexPath
```swift
tableView.getVisibleCellIndexPaths()
```
### 获取可见的分区
```swift
tableView.getVisibleSections()
```

## <span id='date'>Date-Extension</span>  
### 获取当前时间   
```swift
// isLocal是代表是否获取当地的时间(适配国外),swift中默认为true
Date.currentDate()
```   
### 根据北京时间获取当地时间(适配国外)
```swift
let formBeijingTimeinteval = 1309839283
let dateComps = Date.localDate(formBeijingTimeinteval:formBeijingTimeinteval)
```
### 获取时间的一个机构体
```swift
let date = Date()
let dateComps = date.getDateComponents()
```
### 比较时间
```swift
let date = Date()
let dateType = date.comparedDateWithCurrentDate()
```
- 目前支持类型
```swift
        case Unkwon;//未知
        case Yesterday //昨天
        case Today //今天
        case Tomorrow // 明天
        case CurrentYear//今年
        case ThisWeek//这个星期
        case UnTodyYear//非今年
```
### 获取两个时间间隔
```swift
let date1 = Date()
let date2 = Date(timeIntervalSinceNow: 100000)
let dateCom = Date.dateInterval(date1:date1,date2:date2)
```
### 是否是同一天
```swift
/**
  dateString:第一个时间字符串
  date2String:比较的另一个时间字符串
  dateFormatter:时间格式
*/
let isSameDay = Date.isSameDate(dateString:"", date2String: "", dateFormatter: "yyyy-MM-dd HH:mm:ss")
```
### 从时间戳获取时间和时间字符串
```swift
let result = Date.getDateString(fromTimeInterval: 1323434323, formatter: "yyyy-MM-dd HH:mm:ss")
let date = result.0
let dateStr = result.1
```
### 获取当前时间戳（精确到毫秒）
```swift
let milliseconds = Date.getCurrentTimeInterval()
```
## 更新SDK
打tag
```ruby
git tag 1.0.0
```
更新Davis-category.podspec的version  
发布到cocopods
```ruby
pod trunk push Davis-Category.podspec --allow-warnings --verbose
```
如果search不到SDK，先执行add再search：
```ruby
pod repo add Davis-Category https://github.com/cuirhong/Davis-Category.git
```
