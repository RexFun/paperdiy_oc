//
//  NavPresenter.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/16.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "NavPresenter.h"

@implementation NavPresenter

# pragma mark - 初始化tableView
- (id)initWithTableView:(UITableView *)tableView andRefreshControl:(UIRefreshControl *)refreshControl {
    self.models = [[NSMutableArray alloc] init];
    self.tableView = tableView;
    self.refreshControl = refreshControl;
    return self;
}

# pragma mark - 重刷tableView
- (void)reloadTableView {
    //初始化请求路径url
    NSString *sUrl = [AppUtil getActionUrlInPlistWithKey:@"NavAction"];
    sUrl=[sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:sUrl];
    //初始化request
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@",connectionError.localizedDescription);
        } else {
            //获取json数据
            NSArray *datas = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            //清除旧记录
            [self.models removeAllObjects];
            //加载新记录
            for(NSDictionary *data in datas) {
                NavModel *o = [[NavModel alloc] init];
                [o initWithData:data];
                [self.models addObject:o];
            }
            //刷新tableView
            [self.tableView reloadData];
        }
        [self.refreshControl endRefreshing];
    }];}

@end
