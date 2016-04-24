//
//  Created by ZQP on 16/4/23.
//  Copyright © 2016年 max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXModel : NSObject

@property (nonatomic, strong) UIImage  *snap;
@property (nonatomic, strong) UIImage  *icon;
@property (nonatomic, strong) NSString *title;
@end

@interface MXCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *snapView;
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;

@property (nonatomic, strong) MXModel *model;

@end
