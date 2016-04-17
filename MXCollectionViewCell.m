
#import "MXCollectionViewCell.h"

@implementation MXCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        _imageView.layer.cornerRadius = 5;
        _imageView.clipsToBounds = YES;
    }
    
    return self;
}

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    _imageView.layer.cornerRadius = 5;
    _imageView.clipsToBounds = YES;
    _appIcon.layer.cornerRadius = 2;
    _appIcon.clipsToBounds = YES;
    

}

@end
