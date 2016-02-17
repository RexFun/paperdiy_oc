//
//  AppUtil.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "AppUtil.h"

@implementation AppUtil

static NSDictionary* actionUrlDict = nil;

# pragma mark - 根据key值获取plist中的action请求url
+ (NSString*)getActionUrlInPlistWithKey:(NSString*)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"actionUrlInfo" ofType:@"plist"];
        actionUrlDict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    });
    return [actionUrlDict objectForKey:key];
}

@end
