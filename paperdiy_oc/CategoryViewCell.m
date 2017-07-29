//
//  NavViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/15.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "CategoryViewCell.h"

@implementation CategoryViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setWithModel:(Category *)model {
    self.vId.text   = model.vId;
    self.vName.text = model.vName;
    self.vQty.text  = [NSString stringWithFormat:@"%@", model.vQty];
}
@end
