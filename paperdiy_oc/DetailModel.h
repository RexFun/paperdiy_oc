//
//  DetailCollectionModel.h
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property NSString *detailImgId;
@property NSString *detailImgPid;
@property NSString *detailImgSort;

- (void)initWithData: (NSDictionary *) data;

@end
