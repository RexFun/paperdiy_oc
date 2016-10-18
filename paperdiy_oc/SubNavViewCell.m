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
    [self.subNavImg sd_setImageWithURL:model.subNavImageUrl placeholderImage:[UIImage imageNamed:@"Placeholder.pdf"]];
    self.subNavId.text = model.subNavId;
    self.subNavName.text = model.subNavName;
}


@end
