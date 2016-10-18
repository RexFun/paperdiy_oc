//
//  DetailCollectionModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppUtil.h"

@interface DetailModel : NSObject

@property NSString *detailImgId;
@property NSString *detailImgPid;
@property NSString *detailImgSort;
@property NSString *detailImgUrl;

- (void)initWithData: (NSDictionary *) data;

@end
