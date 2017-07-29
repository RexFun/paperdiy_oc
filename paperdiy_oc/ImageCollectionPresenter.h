//
//  DetailCollectionPresenter.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "MJRefresh.h"
#import "AppUtil.h"
#import "Image.h"
#import "RicoUIAlert.h"

@interface ImageCollectionPresenter : NSObject

@property NSMutableArray<Image*>* models;
@property UIViewController*             ctx;
@property UICollectionView*             collectionView;
@property UIRefreshControl*             refreshControl;
@property NSString*                     modelId;

- (id)initWithCtx:(UIViewController*)ctx andCollectionView:(UICollectionView*)collectionView andModelId:(NSString*)modelId;
- (void)pullDownRefresh;
- (void)pullUpRefresh;

@end
