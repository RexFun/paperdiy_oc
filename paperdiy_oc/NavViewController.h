//
//  NavViewController.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/15.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavViewCell.h"
#import "NavPresenter.h"

@interface NavViewController : UITableViewController
@property NavPresenter *navPresenter;
@end
