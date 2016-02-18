//
//  SubNavViewCell.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppUtil.h"
#import "SubNavModel.h"

@interface SubNavViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *subNavId;
@property (weak, nonatomic) IBOutlet UILabel *subNavName;
@property (weak, nonatomic) IBOutlet UIImageView *subNavImg;

- (void)setWithModel:(SubNavModel *)model ;

@end
