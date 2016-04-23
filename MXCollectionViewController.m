
#import "MXCollectionViewController.h"
#import "MXCollectionViewCell.h"
#import "UIImage+MXAdd.h"

#define SCREEN_SCALE [UIScreen mainScreen].scale
#define SNAP_SIZE CGSizeMake(400 * SCREEN_SCALE, 664 * SCREEN_SCALE)
#define ICON_SIZE CGSizeMake(32 * SCREEN_SCALE, 32 * SCREEN_SCALE)

@interface MXCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong, nonnull) NSArray *items;

@end

@implementation MXCollectionViewController

static NSString * const CellReuseIdentifier = @"CellReuseIdentifier";

- (void)viewDidLoad
{
    NSArray *mxData = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MXData" ofType:@"plist"]];
    NSMutableArray *array = [NSMutableArray array];
    
    UINib *cellNib = [UINib nibWithNibName:@"MXCollectionViewCell" bundle:[NSBundle mainBundle]];
    
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:CellReuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.collectionView.bounds];
    backImageView.image = [UIImage imageNamed:@"Snap/10366009.jpg"];
    self.collectionView.backgroundView = backImageView;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSArray *item in mxData)
        {
            @try {
                MXModel *model = [MXModel new];
                
                model.title = item[0];
                model.snap = [UIImage simpleResizeImage:[UIImage imageNamed:item[1]] toSize:SNAP_SIZE];
                model.icon = [UIImage simpleResizeImage:[UIImage imageNamed:item[2]] toSize:ICON_SIZE] ;
                
                [array addObject:model];
                
            } @catch (NSException *exception) {
                NSLog(@"MXData.plist has problems");
            } @finally {
                
            }
            
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.items = array;
            [self.collectionView reloadData];
        });
    });
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MXCollectionViewCell *cell = (MXCollectionViewCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    [self configureCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)configureCell:(MXCollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    cell.model = _items[indexPath.row];

}
@end