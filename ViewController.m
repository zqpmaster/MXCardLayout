//
//  ViewController.m
//  MXCardViewLayout
//
//  Created by ROBERA GELETA on 1/23/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//
#define TAG 99

#import "ViewController.h"
#import "MXCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController


- (void)viewDidLoad
{
    [self.collectionView registerClass:[MXCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
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
    UIView  *subview = [cell.contentView viewWithTag:TAG];
    [subview removeFromSuperview];

//    cell.imageView.image =  [UIImage imageNamed:@"i1"];
//    cell.mainLabel.text = @"Glaciers";
    
    cell.backgroundColor = [UIColor grayColor];

}
@end
