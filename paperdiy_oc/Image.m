//
//  DetailCollectionModel.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "Image.h"

@implementation Image

- (void)initWithData: (NSDictionary *) data {
    self.vId   = [NSString stringWithFormat:@"%@",[data objectForKey:@"ID"]];
    self.vCategoryId  = [NSString stringWithFormat:@"%@",[data objectForKey:@"CATEGORYID"]];
    self.vSort = [NSString stringWithFormat:@"%@",[data objectForKey:@"SORT"]];
    self.vImgUrl = [[AppUtil getActionUrlInPlistWithKey:@"AppImagePath"] stringByAppendingString:[data objectForKey:@"NAME"]];
}

@end
