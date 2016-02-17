//
//  NavModel.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "NavModel.h"

@implementation NavModel

- (void)initWithData: (NSDictionary *) data {
    self.navId = [NSString stringWithFormat:@"%@",[data objectForKey:@"ID"]];
    self.navName = [data objectForKey:@"NAME"];
    self.navQty = [NSString stringWithFormat:@"%@",[data objectForKey:@"QTY"]];
}

@end
