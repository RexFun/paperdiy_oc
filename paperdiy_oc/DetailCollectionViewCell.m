//
//  DetailCollectionViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell

- (void)setWithModel:(DetailModel *)model {
 
    [self.detailImgView sd_setImageWithURL:model.detailImgUrl placeholderImage:[UIImage imageNamed:@"Placeholder.pdf"]];
    self.detailImgId.text    = model.detailImgId;
    self.detailImgSort.text  = [NSString stringWithFormat:@"第 %@ 步", model.detailImgSort];
}

@end
