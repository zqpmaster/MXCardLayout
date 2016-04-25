# MXCardLayout

[![Build Status](https://travis-ci.org/zqpmaster/MX.svg?branch=master)](https://travis-ci.org/zqpmaster/MX)
![License](https://img.shields.io/github/license/mashape/apistatus.svg)



MXCardLayout reproduces the behavior seen in iOS9's multitasking switcher.

![Preview](MXCardLayout.gif)
<!--<img src="MXCardLayout.gif" style="width:92px;height:165px;">
-->

### Usage

- Create a UICollectionViewController with MXCardLayout

```
	MXCardLayout *layout = [[MXCardLayout alloc] init]; 

	layout.itemSize = CGSizeMake(100,150);
    
	MXCollectionViewController *vc = [[MXCollectionViewController alloc] initWithCollectionViewLayout:layout];
    
```

### Installation
There are two ways to use MXCardLayout in your project:

- using CocoaPods
- copying all the files into your project

#### Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```
platform :ios, '8.1'
pod 'MXCardLayout'
```

If you are using Swift, be sure to add `use_frameworks!` and set your target to iOS 8+:

```
platform :ios, '8.0'
use_frameworks!
pod 'MXCardLayout'
```



###License
MXCardLayout is released under a MIT License. See LICENSE file for details.
