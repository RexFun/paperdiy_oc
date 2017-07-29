//
//  SubNavPresenter.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "AppUtil.h"
#import "Model.h"
#import "RicoUIAlert.h"

@interface ModelPresenter : NSObject

@property NSMutableArray<Model*>* models;
@property UIViewController*       ctx;
@property UICollectionView*       collectionView;
@property UIRefreshControl*       refreshControl;
@property NSString*               categoryId;

- (id)initWithCtx:(UIViewController*)ctx andCollectionView:(UICollectionView*)collectionView andCategoryId:(NSString*)categoryId;
- (void)pullDownRefresh;
- (void)pullUpRefresh;

@end
