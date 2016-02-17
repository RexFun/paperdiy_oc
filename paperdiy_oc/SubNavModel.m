//
//  SubNavModel.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "SubNavModel.h"

@implementation SubNavModel

- (void)initWithData: (NSDictionary *) data {
    self.subNavId = [NSString stringWithFormat:@"%@",[data objectForKey:@"ID"]];
    self.subNavName = [data objectForKey:@"NAME"];
}

@end
