//
//  ServerController.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "ServerController.h"

@implementation ServerController

static NSArray *datas;
static NSMutableArray *navModels;

+ (void) getServerDatasToUITable: (UITableView *)tableView andToUIRefreshControl: (UIRefreshControl *)rc {
    NSString *sUrl = @"http://192.168.19.123:8181/paper/client/nav/getNavDataJson.action";
    sUrl=[sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:sUrl];
    
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
    
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@",connectionError.localizedDescription);
        } else {
            datas = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            navModels = [[NSMutableArray alloc] init];
            for(NSDictionary *data in datas) {
                NavModel *obj = [[NavModel alloc] init];
                [obj initWithData:data];
                [navModels addObject:obj];
            }
            [tableView reloadData];
            
        }
        [rc endRefreshing];
        
    }];
}

@end
