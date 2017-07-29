//
//  NavPresenter.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "AppUtil.h"
#import "Category.h"
#import "RicoUIAlert.h"

//接口写法
//@protocol ReloadTableViewByModelsDelegate
//- (id) initWithTableView:(UITableView *)tableView;
//- (void) reloadTableView;
//@end
//
//@interface NavPresenter : NSObject <ReloadTableViewByModelsDelegate>
//@property NSMutableArray<NavModel *> *models;
//@property UITableView *tableView;
//@end

@interface CategoryPresenter : NSObject

@property NSMutableArray<Category*>* models;
@property UIViewController*          ctx;
@property UITableView*               tableView;
@property UIRefreshControl*          refreshControl;

- (id)initWithCtx:(UIViewController*)ctx andTableView:(UITableView*)tableView andRefreshControl:(UIRefreshControl*)refreshControl;
- (void)reloadTableView;

@end
