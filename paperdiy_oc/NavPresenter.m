//
//  NavPresenter.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "NavPresenter.h"

@implementation NavPresenter

- (id) initWithTableView:(UITableView *)tableView {
    self.models = [[NSMutableArray alloc] init];
    self.tableView = tableView;
    return self;
}

- (void) reloadTableView {
    NSString *sUrl = @"http://192.168.19.123:8181/paper/client/nav/getNavDataJson.action";
    sUrl=[sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:sUrl];
    
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
    
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@",connectionError.localizedDescription);
        } else {
            NSArray *datas = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
//            for(NSDictionary *item in datas) {
//                NSLog(@"Id: %@", [item objectForKey:@"ID"]);
//                NSLog(@"Name: %@", [item objectForKey:@"NAME"]);
//                NSLog(@"Qty: %@", [item objectForKey:@"QTY"]);
//            }
            for(NSDictionary *data in datas) {
                NavModel *o = [[NavModel alloc] init];
                [o initWithData:data];
                [self.models addObject:o];
            }

            [self.tableView reloadData];
        }
        //[self.refreshControl endRefreshing];
    }];}

@end
