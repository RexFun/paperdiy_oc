//
//  AppUtil.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "AppUtil.h"

@implementation AppUtil

static NSDictionary* d = nil;

# pragma mark - 根据key值获取plist中的action请求url
+ (NSString*)getActionUrlInPlistWithKey:(NSString*)key
{
    return [[self getUrlStringByKey:@"AppWebPath"] stringByAppendingString:[self getUrlStringByKey:key]];
}

# pragma mark - 根据key值获取plist中的url字符串
+ (NSString*)getUrlStringByKey:(NSString*)key
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Url" ofType:@"plist"];
        d = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    });
    return [d objectForKey:key];
}
@end
