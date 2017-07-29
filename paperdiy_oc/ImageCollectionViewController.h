//
//  ImageCollectionViewController.h
//  paperdiy_oc
//
//  Created by ole on 2017/7/29.
//  Copyright © 2017年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "ImageCollectionViewCell.h"
#import "ImageCollectionPresenter.h"

@interface ImageCollectionViewController : UICollectionViewController

@property(strong,nonatomic)NSValue *vModelId;//接收来自ModelView  controller传来的值
@property(strong,nonatomic)NSValue *vModelName;//接收来自ModelView  controller传来的值

@property ImageCollectionPresenter *imageCollectionPresenter;

@end
