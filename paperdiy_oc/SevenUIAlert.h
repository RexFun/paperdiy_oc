//
//  SevenUIAlert.h
//  paperdiy_oc
//
//  Created by mac373 on 17/1/20.
//  Copyright © 2017年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SevenUIAlert : NSObject
+ (UIAlertController*) initNoticeWithTitle:(NSString*)title andMsg:(NSString*)msg andBtnTitle:(NSString*)btnTitle;
@end
