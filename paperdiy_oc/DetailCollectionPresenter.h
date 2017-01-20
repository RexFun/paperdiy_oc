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
#import "DetailModel.h"
#import "SevenUIAlert.h"

@interface DetailCollectionPresenter : NSObject

@property NSMutableArray<DetailModel*>* models;
@property UIViewController*             ctx;
@property UICollectionView*             collectionView;
@property UIRefreshControl*             refreshControl;
@property NSString*                     subNavId;

- (id)initWithCtx:(UIViewController*)ctx andCollectionView:(UICollectionView*)collectionView andSubNavId:(NSString*)subNavId;
- (void)pullDownRefresh;
- (void)pullUpRefresh;

@end
