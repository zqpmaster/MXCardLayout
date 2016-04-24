
#import "MXCardLayout.h"
#import <math.h>

@interface MXCardLayout ()

@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat virtualItemWidth;

@property (nonatomic) NSInteger visibleCount;

@end

#define MARGIN (_viewWidth / 3 - _virtualItemWidth / 2)

@implementation MXCardLayout

- (void)dealloc
{
    
}

- (void)prepareLayout
{
    [super prepareLayout];
    if (self.visibleCount < 1)
    {
        self.visibleCount = 5;
    }
    
    self.viewWidth = CGRectGetWidth(self.collectionView.frame);
    self.virtualItemWidth = self.itemSize.width/2;
}

- (CGSize)collectionViewContentSize {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];

    return CGSizeMake(cellCount * _virtualItemWidth + MARGIN * 3, [UIScreen mainScreen].bounds.size.height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat centerX = (self.collectionView.contentOffset.x) + _viewWidth / 2;
    NSInteger index = centerX / _virtualItemWidth;
    NSInteger count = (self.visibleCount - 1) / 2;
    NSInteger minIndex = MAX(0, (index - count));
    NSInteger maxIndex = MIN((cellCount - 1), (index + count));
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = minIndex; i <= maxIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = self.itemSize;
    
    CGFloat cX = (self.collectionView.contentOffset.x) + _viewWidth / 2;
    CGFloat attributesX = _virtualItemWidth * indexPath.row + _virtualItemWidth / 2 + MARGIN;
    attributes.zIndex = attributesX/_virtualItemWidth;
    
    CGFloat delta = cX - attributesX;
    
    CGFloat ratio = delta / (_virtualItemWidth);
    
    CGFloat centerX = attributesX;
    
    CGFloat offset =  pow((-ratio + 2), 3)/23 * _itemSize.width;
    centerX = cX - _viewWidth/2 + offset + _itemSize.width / 2 - 5;
    
    CGFloat scale = (-ratio + 2 - 2)/50 + 1;
    attributes.transform = CGAffineTransformMakeScale(scale, scale);//x scale has something doesn`t right
    
    if (ratio > 1.3)
    {
        attributes.alpha = MAX(0, 2.3 - ratio);
    }

    attributes.center = CGPointMake(centerX, CGRectGetHeight(self.collectionView.frame) / 2);
    
    return attributes;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat index = roundf((proposedContentOffset.x + _viewWidth / 3 - _itemSize.width / 2) / _virtualItemWidth);
    proposedContentOffset.x = _virtualItemWidth * index + _itemSize.width / 2 - _viewWidth / 3;
    
    return proposedContentOffset;

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}

@end

