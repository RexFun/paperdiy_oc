//
//  DetailPageViewController.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailScrollPageViewCell.h"
#import "DetailScrollPagePresenter.h"

@interface DetailScrollPageViewController : UIViewController<UIScrollViewDelegate>

@property(strong,nonatomic)NSValue *subNavId;//接收来自DetailCollectionView controller传来的值
@property(strong,nonatomic)NSValue *subNavName;//接收来自DetailCollectionView controller传来的值
@property(strong,nonatomic)NSValue *detailImgId;//接收来自DetailCollectionView controller传来的值
@property(strong,nonatomic)NSValue *detailImgPid;//接收来自DetailCollectionView controller传来的值
@property(strong,nonatomic)NSValue *detailImgSort;//接收来自DetailCollectionView controller传来的值
@property(strong,nonatomic)NSValue *indexPath;//接收来自DetailCollectionView controller传来的值

@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *imgPageControl;

@property DetailScrollPagePresenter *detailScrollPagePresenter;

@end
