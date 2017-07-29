//
//  DetailCollectionModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppUtil.h"

@interface Image : NSObject

@property NSString *vId;
@property NSString *vCategoryId;
@property NSString *vSort;
@property NSString *vImgUrl;

- (void)initWithData: (NSDictionary *) data;

@end
