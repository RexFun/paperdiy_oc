//
//  NavModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavModel : NSObject

@property NSString *navId;
@property NSString *navName;
@property NSString *navQty;

- (void)initWithData: (NSDictionary *) data;

@end
