
#import "UIImage+MXAdd.h"

@implementation UIImage (MXAdd)

+ (UIImage *)resizeImage:(UIImage*)image toViewSize:(CGSize)size{
    CGSize imageSize = image.size;
    CGSize toSize = CGSizeMake(round(size.width*[UIScreen mainScreen].scale/image.scale), round(size.height*[UIScreen mainScreen].scale/image.scale));
    
    UIImage *scaledImage = image;
    if (!CGSizeEqualToSize(imageSize, toSize))
    {
        
        CGRect drawRect = CGRectMake(0, 0, toSize.width, toSize.height);
        if (imageSize.width/imageSize.height > toSize.width/toSize.height)
        {
            //宽图
            drawRect.origin.x = -round((imageSize.width/imageSize.height - toSize.width/toSize.height) / 2 * toSize.height);
            drawRect.size.width = round(imageSize.width/imageSize.height * toSize.height);
            
        }else
        {
            //高图
            drawRect.origin.y = -round((imageSize.height/imageSize.width - toSize.height/toSize.width) / 2 * toSize.width);
            drawRect.size.height = round(imageSize.height/imageSize.width * toSize.width);
        }
        
        UIGraphicsBeginImageContext(toSize);
        [image drawInRect:drawRect];
        scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    
    return scaledImage;
}

+ (UIImage *)simpleResizeImage:(UIImage*)image toSize:(CGSize)size{
    CGRect rect={0,0,size};
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:rect];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end
