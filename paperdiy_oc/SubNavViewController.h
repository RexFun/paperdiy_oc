//
//  SubNavViewController.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "SubNavViewCell.h"
#import "SubNavPresenter.h"

@interface SubNavViewController : UICollectionViewController

@property(strong,nonatomic)NSValue *navId;//接收来自NavView  controller传来的值
@property(strong,nonatomic)NSValue *navName;//接收来自NavView  controller传来的值
@property(strong,nonatomic)NSValue *navQty;//接收来自NavView  controller传来的值

@property SubNavPresenter *subNavPresenter;

@end
