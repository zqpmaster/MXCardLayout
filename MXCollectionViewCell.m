
#import "MXCollectionViewCell.h"

@implementation MXCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_imageView];
    }
    
    return self;
}

@end
