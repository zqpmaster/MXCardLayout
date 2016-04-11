
#define TAG 99

#import "ViewController.h"
#import "MXCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong, nonnull) NSArray *images;

@end

@implementation ViewController


- (void)viewDidLoad
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++)
    {
        NSString *name = [NSString stringWithFormat:@"Snap/IMG_72%d", (i + 11)];
        UIImage *image = [UIImage imageNamed:name];
        if (image)
        {
            [array addObject:image];
        }
    }
    
    self.images = array;
    
    [self.collectionView registerClass:[MXCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.collectionView.bounds];
    backImageView.image = [UIImage imageNamed:@"Snap/10366009.jpg"];
    self.collectionView.backgroundView = backImageView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MXCollectionViewCell *cell = (MXCollectionViewCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    [self configureCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)configureCell:(MXCollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    cell.imageView.image = _images[indexPath.row];
    cell.backgroundColor = [UIColor grayColor];

}
@end
