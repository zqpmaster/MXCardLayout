# MX

[![Build Status](https://travis-ci.org/zqpmaster/MX.svg?branch=master)](https://travis-ci.org/zqpmaster/MX)


MXCardViewLayout reproduces the behavior seen in iOS9's multitasking switcher.

![Preview](MXCardLayout.gif)

### Usage

- Create a UICollectionView with MXCardLayout

```objc

    MXCardViewLayout *layout = [[MXCardViewLayout alloc] init];
    
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2/3, [UIScreen mainScreen].bounds.size.height);
    
    MXCollectionViewController *vc = [[MXCollectionViewController alloc] initWithCollectionViewLayout:layout];
```

###License
MXCardViewLayout is released under a MIT License. See LICENSE file for details.