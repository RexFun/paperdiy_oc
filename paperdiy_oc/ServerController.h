//
//  ServerController.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NavModel.h"

@interface ServerController : NSObject

+ (void) getServerDatasToUITable: (UITableView *)tableView andToUIRefreshControl: (UIRefreshControl *)rc;

@end
