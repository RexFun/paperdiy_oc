//
//  SevenUIAlert.m
//  paperdiy_oc
//
//  Created by mac373 on 17/1/20.
//  Copyright © 2017年 rexfun. All rights reserved.
//

#import "SevenUIAlert.h"

@implementation SevenUIAlert
+ (UIAlertController*) initNoticeWithTitle:(NSString*)title andMsg:(NSString*)msg andBtnTitle:(NSString*)btnTitle
{
    UIAlertController* a = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleDefault handler:nil];
    [a addAction:okAction];
    return a;
}
@end
