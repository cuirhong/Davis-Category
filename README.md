# Davis-Category
根据多年+多项目经验,封装了很多常用的工具(如:Date-Categoty,常用的操作:时间字符串转换、获取当地时间、获取星期、昨日、今日、明日等)

# 接入SDK
```
pod 'Davis-Category', :git => 'https://github.com/cuirhong/Davis-Category.git'
```

### 更新SDK
1. 打tag
```
git tag 1.0.0
```
2. 更新Davis-category.podspec的version
3. 发布到cocopods
```
pod trunk push Davis-Category.podspec --allow-warnings --verbose
```
