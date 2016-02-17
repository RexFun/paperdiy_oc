//
//  NavModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavModel : NSObject

@property NSString *sectionId;
@property NSString *sectionName;
@property NSString *sectionQty;
@property NSArray *datas;

- (void)initWithData: (NSDictionary *) data;

@end
