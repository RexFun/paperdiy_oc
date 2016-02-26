//
//  DetailCollectionViewCell.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "AppUtil.h"
#import "DetailModel.h"

@interface DetailCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *detailImgId;
@property (weak, nonatomic) IBOutlet UILabel *detailImgSort;
@property (weak, nonatomic) IBOutlet UIImageView *detailImgView;

- (void)setWithModel:(DetailModel *)model ;

@end
