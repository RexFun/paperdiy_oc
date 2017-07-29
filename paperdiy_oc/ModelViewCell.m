//
//  SubNavViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "ModelViewCell.h"

@implementation ModelViewCell

- (void)setWithModel:(Model *)model
{
    self.vId.text = model.vId;
    self.vName.text = model.vName;
    [self.vImg sd_setImageWithURL:model.vImageUrl placeholderImage:[UIImage imageNamed:@"Placeholder.pdf"]];
}


@end
