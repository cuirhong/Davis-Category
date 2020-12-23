# UITableView-Extension

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