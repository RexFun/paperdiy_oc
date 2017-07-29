//
//  ModelViewController.h
//  paperdiy_oc
//
//  Created by ole on 2017/7/29.
//  Copyright © 2017年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "ModelViewCell.h"
#import "ModelPresenter.h"

@interface ModelViewController : UICollectionViewController<UICollectionViewDelegateFlowLayout>

@property(strong,nonatomic)NSValue *vCategoryId;//接收来自NavView  controller传来的值
@property(strong,nonatomic)NSValue *vCategoryName;//接收来自NavView  controller传来的值
@property(strong,nonatomic)NSValue *vCategoryQty;//接收来自NavView  controller传来的值

@property ModelPresenter *modelPresenter;

@end
