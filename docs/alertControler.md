# UIAlertController-Extension

### 快速创建一个alert
```swift
   let alert = UIAlertController.alert(title: "", message: "", style: .alert, doneTitle: "OK", doneAction: { (alertAction) in
            
        }, cancelTitle: "Cancel", cancelAction: { (cancelAlert) in
             
        }, destruectiveTitle: "Destruective") { (destruectiveAction) in
             
        }
```
### 修改action的字体颜色
```swift
UIAlertController.setActionTitle(actions: [], color: .red)
```
### 修改title的颜色
```swift
 alert.changeTitle(color: .red, font: UIFont())
```
### 修改message
```swift
 alert.changeMessage(color: .gray, font: UIFont())
```