# MXCardLayout 
[![Build Status](https://travis-ci.org/zqpmaster/MXCardLayout.svg?branch=master)](https://travis-ci.org/zqpmaster/MXCardLayout) ![License](https://img.shields.io/github/license/mashape/apistatus.svg) ![Platform](https://img.shields.io/cocoapods/p/GlitchLabel.svg?style=flat)

### Introduction

MXCardLayout reproduces the behavior seen in iOS9's multitasking switcher.

MXCardLayout是仿iOS9多任务切换实现的一个卡片流布局。

![Preview](MXCardLayout.gif)
<!--<img src="MXCardLayout.gif" style="width:106px;height:188px;">
-->

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

### Usage

- Create a UICollectionViewController with MXCardLayout

```
	MXCardLayout *layout = [[MXCardLayout alloc] init]; 

	layout.itemSize = CGSizeMake(100,150);
    
	UICollectionViewController *vc = [[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
    
```
### Changelog

#### Version: 0.1.0

  * Initial Build

###License
MXCardLayout is released under a MIT License. See LICENSE file for details.
