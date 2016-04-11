//
//  MXCollectionViewCell.m
//  MXCardViewLayout
//
//  Created by ROBERA GELETA on 1/23/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "MXCollectionViewCell.h"

@implementation MXCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {

        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DJI00479.jpg"]];
        _imageView.frame = self.contentView.bounds;
        
        [self.contentView addSubview:_imageView];
//        self.layer.borderWidth = 1;
//        self.layer.borderColor = [UIColor blueColor].CGColor;
        _imageView.layer.cornerRadius = 5;

    }
    
    return self;
}

@end
