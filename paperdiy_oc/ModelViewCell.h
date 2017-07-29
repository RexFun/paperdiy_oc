//
//  SubNavViewCell.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "AppUtil.h"
#import "Model.h"

@interface ModelViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *vId;
@property (weak, nonatomic) IBOutlet UILabel *vName;
@property (weak, nonatomic) IBOutlet UIImageView *vImg;

- (void)setWithModel:(Model *)model ;

@end
