//
//  SubNavModel.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)initWithData: (NSDictionary *) data {
    self.vId   = [NSString stringWithFormat:@"%@",[data objectForKey:@"ID"]];
    self.vName = [data objectForKey:@"NAME"];
    self.vImageUrl = [[AppUtil getActionUrlInPlistWithKey:@"AppImagePath"] stringByAppendingString:[data objectForKey:@"IMAGE_NAME"]];
    NSLog(@"%@", self.vImageUrl);
}

@end
