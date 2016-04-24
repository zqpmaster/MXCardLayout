# MXCardLayout

[![Build Status](https://travis-ci.org/zqpmaster/MX.svg?branch=master)](https://travis-ci.org/zqpmaster/MX)
![License](https://img.shields.io/github/license/mashape/apistatus.svg)



MXCardLayout reproduces the behavior seen in iOS9's multitasking switcher.

![Preview](MXCardLayout.gif) {width=184px height=330px})

### Usage

- Create a UICollectionViewController with MXCardLayout

```
	MXCardLayout *layout = [[MXCardLayout alloc] init]; 

	layout.itemSize = CGSizeMake(100,150);
    
	MXCollectionViewController *vc = [[MXCollectionViewController alloc] initWithCollectionViewLayout:layout];
    
```

###License
MXCardLayout is released under a MIT License. See LICENSE file for details.
