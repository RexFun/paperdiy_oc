//
//  DetailCollectionViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (void)setWithModel:(Image *)model {
 
    [self.vImg sd_setImageWithURL:model.vImgUrl placeholderImage:[UIImage imageNamed:@"Placeholder.pdf"]];
    self.vId.text    = model.vId;
    self.vSort.text  = [NSString stringWithFormat:@"第 %@ 步", model.vSort];
}

@end
