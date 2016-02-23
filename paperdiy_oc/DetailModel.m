//
//  DetailCollectionModel.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

- (void)initWithData: (NSDictionary *) data {
    self.detailImgId   = [NSString stringWithFormat:@"%@",[data objectForKey:@"ID"]];
    self.detailImgPid  = [NSString stringWithFormat:@"%@",[data objectForKey:@"PID"]];
    self.detailImgSort = [NSString stringWithFormat:@"%@",[data objectForKey:@"SORT"]];
}

@end
