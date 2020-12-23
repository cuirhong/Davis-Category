# 更新SDK
- 打tag，tag对应为SDK的版本
```ruby
git tag 1.0.0
```
- 更新Davis-category.podspec的version，version对应上面的tag

- 发布到cocopods
```ruby
pod trunk push Davis-Category.podspec --allow-warnings --verbose
```
如果search不到SDK，先执行add再search：
```ruby
pod repo add Davis-Category https://github.com/cuirhong/Davis-Category.git
```
