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
#import "AppUtil.h"
#import "DetailModel.h"

@interface DetailCollectionPresenter : NSObject

@property NSMutableArray<DetailModel *> *models;
@property UICollectionView              *collectionView;
@property UIRefreshControl              *refreshControl;
@property NSString                      *subNavId;

- (id)initWithCollectionView:(UICollectionView *)collectionView andSubNavId:(NSString *)subNavId;
- (void)pullDownRefresh;
- (void)pullUpRefresh;

@end