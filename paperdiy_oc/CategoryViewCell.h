//
//  NavViewCell.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/15.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"

@interface CategoryViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *vId;
@property (weak, nonatomic) IBOutlet UILabel *vName;
@property (weak, nonatomic) IBOutlet UILabel *vQty;
@property (weak, nonatomic) IBOutlet UIImageView *vImg;

- (void)setWithModel:(Category *)model ;

@end
