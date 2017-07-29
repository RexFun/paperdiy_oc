//
//  NavModel.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "Category.h"

@implementation Category

- (void)initWithData: (NSDictionary *) data {
    self.vId   = [NSString stringWithFormat:@"%@",[data objectForKey:@"ID"]];
    self.vName = [data objectForKey:@"NAME"];
    self.vQty  = [NSString stringWithFormat:@"%@",[data objectForKey:@"QTY"]];
}

@end
