//
//  SubNavModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppUtil.h"

@interface Model : NSObject

@property NSString *vId;
@property NSString *vName;
@property NSString *vImageUrl;

- (void)initWithData: (NSDictionary *) data;

@end
