//
//  DetailScrollPagePresenter.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "AppUtil.h"
#import "Image.h"
#import "ImageScrollPageViewCell.h"
#import "RicoUIAlert.h"


@interface ImageScrollPagePresenter : NSObject<UIScrollViewDelegate>

@property NSMutableArray<Image *> *models;
@property UIViewController              *ctx;
@property UIScrollView                  *scrollView;
@property UIPageControl                 *pageControl;
@property NSString                      *modelId;
@property NSIndexPath                   *indexPath;

- (id)initWithCtx:(UIViewController *)ctx andScrollView:(UIScrollView *)scrollView andPageControl:(UIPageControl *) pageControl andModelId:(NSString *)modelId andIndexPath:(NSIndexPath *)indexPath;
- (void)reloadView;
- (void)drawView;

@end
