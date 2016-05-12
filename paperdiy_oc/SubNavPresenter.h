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
#import "SubNavModel.h"

@interface SubNavPresenter : NSObject

@property NSMutableArray<SubNavModel *> *models;
@property UICollectionView              *collectionView;
@property UIRefreshControl              *refreshControl;
@property NSString                      *navId;

- (id)initWithCollectionView:(UICollectionView *)collectionView andNavId:(NSString *)navId;
- (void)pullDownRefresh;
- (void)pullUpRefresh;

@end
