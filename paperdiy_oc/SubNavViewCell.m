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
    NSLog(@"subNavId : %@", model.subNavId);
    NSLog(@"subNavName : %@", model.subNavName);
    self.subNavId.text = model.subNavId;
    self.subNavName.text = model.subNavName;
}

@end
