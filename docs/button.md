# UIButton-Extension

### 按钮初始化
支持可选参数，快速创建一个按钮（支持normal，selected，highlighted）
```swift
let button = UIButton(title: "", highTitle: "", selTitle: "", backgroundColor: .white, highlightedImage: UIImage(), imageName: "", selImageName: "", backImageName: "", backImage: UIImage(), backImageColor: .white, highlightedImageName: "", selBackImage: "", selBackImageName: "", selBackImageColor: .white, cornerRadius: 0, target: self, selector: #selector(clickButton), font: UIFont(), titleColor: .black, titleHighColor: .lightGray, selTitleColor: .green)
```
### 修改image和title的位置
```swift
//设置按钮的标题在左边，image在右边，间距为5，state为normal
button.positionLabelRespectToImage(position: .left, spacing: 5, state: .normal)
```