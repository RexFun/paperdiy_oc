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
#import "Image.h"

@interface ImageCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *vId;
@property (weak, nonatomic) IBOutlet UILabel *vSort;
@property (weak, nonatomic) IBOutlet UIImageView *vImg;

- (void)setWithModel:(Image *)model ;

@end
