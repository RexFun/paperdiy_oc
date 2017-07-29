//
//  NavModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject

@property NSString *vId;
@property NSString *vName;
@property NSString *vQty;

- (void)initWithData: (NSDictionary *) data;

@end
