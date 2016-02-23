//
//  DetailScrollPageViewCell.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppUtil.h"
#import "DetailModel.h"

@interface DetailScrollPageViewCell : UIView

@property UILabel     *detailImgId;
@property UILabel     *detailImgSort;
@property UIImageView *detailImgView;

- (void)setWithModel:(DetailModel *)model ;

@end
