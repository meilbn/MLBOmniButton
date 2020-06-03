# MLBOmniButton
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/meilbn/MLBOmniButton/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/MLBOmniButton.svg)](http://cocoapods.org/?q=MLBOmniButton)
[![Language](https://img.shields.io/badge/language-Objective--C-brightgreen.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://www.apple.com/nl/ios/)
[![Support](https://img.shields.io/badge/support-iOS%207+%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)


## Recommend Use Swift Version: [](https://github.com/meilbn/MLButton)


An Easy-to-use UIButton custom controls, including some of the common needs of the feature.

**[中文介绍](https://github.com/meilbn/MLBOmniButton#中文介绍)**

## Demo Project
See ``MLBOmniButtonDemo/MLBOmniButtonDemo.xcworkspace``.

### use Frame
You can specified button's size of frame:

```ObjectiveC
MLBOmniButton *button = [[MLBOmniButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
```

or let it adaptive size:

```ObjectiveC
MLBOmniButton *button = [[MLBOmniButton alloc] init];
```

![][Frame]

### use AutoLayout

![][AutoLayout]

### Show Badge

![][FrameWithBadge]

![][AutoLayoutWithBadge]

### Display Web Image

![][AutoLayoutWithWebImage]

## Bugs
- [x] ~~Not yet supported Masonry or NSLayoutConstraint to add Constraints, will __CRASH__!~~

## Features
- [x] Easy to use
- [x] Use with Storyboards, XIBs, Code
- [x] Can show badges
- [ ] Design in Storyboard or XIB
- [x] Button's imageView support web image

## Version History
- 0.0.2 removed NSLog().
- 0.0.1 first version, contains common features.

## Installation
### CocoaPods
1. Add ``pod 'MLBOmniButton'`` to your Podfile.
2. Run ``pod install`` or ``pod update``.
3. Import \<MLBOmniButton/MLBOmniButton.h\>.

### Carthage
Not yet supported.

### Manually
1. Download all the files in the ``MLBOmniButton`` subdirectory.
2. Add the source files to your Xcode project.
3. Add ``SDWebImage``，version ~> 3.8.2.
4. Import ``MLBOmniButton.h``.

## Requirements
This library requires ``iOS 7.0+`` 和 ``Xcode 7.3.1+``.

## Tested Devices
### Devices
iPhone 5S (iOS 8.3)

~~iPhone 7 Plus (iOS 10.0.2) Not yet tested~~

### Simulators
iPhone 6 (iOS 9.3)

## License
MLBOmniButton is provided under the MIT license. See LICENSE file for details.

# 中文介绍

## 推荐使用 Swift 版: [](https://github.com/meilbn/MLButton)

简单易用的 UIButton 自定义控件，包含一些常见需求的功能。

## 演示项目
运行 ``MLBOmniButtonDemo/MLBOmniButtonDemo.xcworkspace``。

### 纯 Frame
可以指定大小：

```ObjectiveC
MLBOmniButton *button = [[MLBOmniButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
```

也可以让控件自适应大小：

```ObjectiveC
MLBOmniButton *button = [[MLBOmniButton alloc] init];
```

![][Frame]

### 使用 AutoLayout

![][AutoLayout]

### 显示 Badge

![][FrameWithBadge]

![][AutoLayoutWithBadge]

### 显示网络图片

![][AutoLayoutWithWebImage]

## Bugs
- [x] ~~还不支持 Masonry 和 NSLayoutConstant 添加约束，会 __崩溃__！~~

## 功能
- [x] 使用简单
- [x] 可以在 Storyboards、XIB 中使用，当然也可以通过代码创建
- [x] 可以显示 Badges
- [ ] 可以在 Storyboard 或者 XIB 中配置自定义属性
- [x] 按钮的 imageView 支持显示网络图片

## 版本历史
- 0.0.2 移除 NSLog 语句。
- 0.0.1 第一版，包含常用功能。

## 安装
### CocoaPods
1. 在 Podfile 中添加 ``pod 'MLBOmniButton'``。
2. 执行 ``pod install`` 或 ``pod update``。
3. 导入 \<MLBOmniButton/MLBOmniButton.h\>。

### Carthage
暂未支持。

### 手动安装
1. 下载 ``MLBOmniButton`` 文件夹内所有源文件。
2. 将 MLBOmniButton 文件夹内所有源文件添加（拖入）到你的工程中。
3. 添加 ``SDWebImage``，版本 ~> 3.8.2。
4. 导入 ``MLBOmniButton.h``。

## 系统要求
该项目最低支持 ``iOS 7.0`` 和 ``Xcode 7.3.1``。

## 测试设备
### 真机
iPhone 5S (iOS 8.3)

~~iPhone 7 Plus (iOS 10.0.2) 还未测试~~

### 模拟器
iPhone 6 (iOS 9.3)

## 许可证
MLBOmniButton 使用 MIT 许可证，详情见 LICENSE 文件。

[Frame]: https://github.com/meilbn/MLBOmniButton/blob/master/Screenshots/Demo_Frame.png
[AutoLayout]: https://github.com/meilbn/MLBOmniButton/blob/master/Screenshots/Demo_AutoLayout.png
[FrameWithBadge]: https://github.com/meilbn/MLBOmniButton/blob/master/Screenshots/Demo_Frame_with_Badge.png
[AutoLayoutWithBadge]: https://github.com/meilbn/MLBOmniButton/blob/master/Screenshots/Demo_AutoLayout_with_Badge.png
[AutoLayoutWithWebImage]: https://github.com/meilbn/MLBOmniButton/blob/master/Screenshots/Demo_AutoLayout_with_Web_Image.gif

