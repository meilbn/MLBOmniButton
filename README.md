# MLBOmniButton
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/meilbn/MLBOmniButton/master/LICENSE)
[![Language](https://img.shields.io/badge/language-Objective--C-brightgreen.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://www.apple.com/nl/ios/)
[![Support](https://img.shields.io/badge/support-iOS%207+%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

An Easy-to-use UIButton custom controls, including some of the common needs of the feature.

## [中文介绍](https://github.com/meilbn/MLBOmniButton#中文介绍)

## Demo Project
See ``MLBOmniButtonDemo/MLBOmniButtonDemo.xcworkspace``.

### use Frame
You can specified button's size of frame:

```
MLBOmniButton *button = [[MLBOmniButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
```

or let them adaptive size:

```
MLBOmniButton *button = [[MLBOmniButton alloc] init];
```

![][Frame]

### use AutoLayout

![][AutoLayout]

### Show Badge

![][FrameWithBadge]

![][AutoLayoutWithBadge]

## Bugs
- [x] ~~Not yet supported Masonry or NSLayoutConstraint to add Constraints, will __CRASH__!~~

## Features
- [x] Easy to use
- [x] Use with Storyboards, XIBs, Code
- [x] Can show badges
- [ ] Design in Storyboard or XIB
- [ ] Button's imageView support web image

## Installation
### CocoaPods
Not yet supported.

### Carthage
Not yet supported.

### Manually
1. Download all the files in the ``MLBOmniButton`` subdirectory.
2. Add the source files to your Xcode project.
3. Import ``MLBOmniButton.h``.

## Requirements
This library requires ``iOS 7.0+`` 和 ``Xcode 7.3.1+``.

## Tested devices

### Device
iPhone 5S (iOS 8.3)

~~iPhone 7 Plus (iOS 10.0.2) Not yet tested~~

### Simulator
iPhone 6 (iOS 9.3)

## License
MLBOmniButton is provided under the MIT license. See LICENSE file for details.

# 中文介绍
简单易用的 UIButton 自定义控件，包含一些常见需求的功能。

## 演示项目
运行 ``MLBOmniButtonDemo/MLBOmniButtonDemo.xcworkspace``。

### 纯 Frame
可以指定大小：

```
MLBOmniButton *button = [[MLBOmniButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
```

也可以让控件自适应大小：

```
MLBOmniButton *button = [[MLBOmniButton alloc] init];
```

![][Frame]

### 使用 AutoLayout

![][AutoLayout]

### 显示 Badge

![][FrameWithBadge]

![][AutoLayoutWithBadge]

## Bugs
- [x] ~~还不支持 Masonry 和 NSLayoutConstant 添加约束，会 __崩溃__！~~

## 功能
- [x] 使用简单
- [x] 可以在 Storyboards、XIB 中使用，当然也可以通过代码创建
- [x] 可以显示 Badges
- [ ] 可以在 Storyboard 或者 XIB 中配置自定义属性
- [ ] 按钮的 imageView 支持显示网络图片

## 安装
### CocoaPods
暂未支持。

### Carthage
暂未支持。

### 手动安装
1. 下载 MLBOmniButton 文件夹内所有源文件。
2. 将 MLBOmniButton 文件夹内所有源文件添加（拖入）到你的工程中。
3. 导入 ``MLBOmniButton.h``。

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