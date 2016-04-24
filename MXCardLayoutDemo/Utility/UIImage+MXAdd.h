//
//  Created by ZQP on 16/4/23.
//  Copyright © 2016年 max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MXAdd)

+ (UIImage *)resizeImage:(UIImage*)image toViewSize:(CGSize)size;
+ (UIImage *)simpleResizeImage:(UIImage*)image toSize:(CGSize)size;

@end
