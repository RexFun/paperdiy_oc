//
//  SubNavViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "SubNavViewCell.h"

@implementation SubNavViewCell

- (void)setWithModel:(SubNavModel *)model {
    
    NSString *imgUrlStr = [NSString stringWithFormat:[AppUtil getActionUrlInPlistWithKey:@"SubNavImgAction"], model.subNavId];
    NSURL *imgUrl = [NSURL URLWithString:imgUrlStr];
    [self.subNavImg sd_setImageWithURL:imgUrl placeholderImage:nil];
//    [self.subNavImg sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"Placeholder.pdf"]];
    self.subNavId.text = model.subNavId;
    self.subNavName.text = model.subNavName;
}

@end
