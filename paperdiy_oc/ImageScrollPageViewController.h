//
//  DetailPageViewController.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollPageViewCell.h"
#import "ImageScrollPagePresenter.h"

@interface ImageScrollPageViewController : UIViewController<UIScrollViewDelegate>

@property(strong,nonatomic)NSValue *vModelId;//接收来自ImageCollectionView controller传来的值
@property(strong,nonatomic)NSValue *vModelName;//接收来自ImageCollectionView controller传来的值
@property(strong,nonatomic)NSValue *vId;//接收来自ImageCollectionView controller传来的值
@property(strong,nonatomic)NSValue *vCategoryId;//接收来自ImageCollectionView controller传来的值
@property(strong,nonatomic)NSValue *vSort;//接收来自ImageCollectionView controller传来的值
@property(strong,nonatomic)NSValue *indexPath;//接收来自ImageCollectionView controller传来的值

@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *imgPageControl;

@property ImageScrollPagePresenter *imageScrollPagePresenter;

@end
