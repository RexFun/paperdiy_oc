//
//  DetailCollectionViewController.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailCollectionViewCell.h"
#import "DetailCollectionPresenter.h"

@interface DetailCollectionViewController : UICollectionViewController

@property(strong,nonatomic)NSValue *subNavId;//接收来自SubNavView  controller传来的值
@property(strong,nonatomic)NSValue *subNavName;//接收来自SubNavView  controller传来的值

@property DetailCollectionPresenter *detailCollectionPresenter;

@end
