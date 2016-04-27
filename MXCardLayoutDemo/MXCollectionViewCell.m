#import "MXCollectionViewController.h"
#import "MXCollectionViewCell.h"
#import "NSObject+MXAddForKVO.h"
#import "MXKitMacro.h"

@interface MXCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIVisualEffectView *snapBlurEffect;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *iconBlurEffect;

@end

@implementation MXCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        _snapView.layer.cornerRadius = 5;
        _snapView.clipsToBounds = YES;
    }
    
    return self;
}

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    _snapView.layer.cornerRadius = 5;
    _snapView.clipsToBounds = YES;
    _appIcon.layer.cornerRadius = 6;
    _appIcon.clipsToBounds = YES;
    
    @weakify(self)
    [self addObserverBlockForKeyPath:@"alpha" block:^(id obj, id oldVal, id newVal) {
        @strongify(self)
//        self.snapBlurEffect.alpha = MIN(3 * (1 - self.alpha), 0.6);
//        self.iconBlurEffect.alpha = MIN(3 * (1 - self.alpha), 0.6);
        if (self.alpha == 1)
        {
            self.appNameLabel.alpha = 1;
        }else
        {
            self.appNameLabel.alpha = self.alpha / 3;
        }
    }];
}

- (void)setModel:(MXModel *)model
{
    if (_model != model)
    {
        _model = model;
        self.snapView.image = model.snap;
        self.appIcon.image = model.icon;
        self.appNameLabel.text = model.title;
    }
}

- (void)dealloc
{
    [self removeObserverBlocks];
}

@end

@implementation MXModel
@end
