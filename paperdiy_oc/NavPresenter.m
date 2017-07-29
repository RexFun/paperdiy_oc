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
- (id)initWithCtx:(UIViewController*)ctx andTableView:(UITableView *)tableView andRefreshControl:(UIRefreshControl *)refreshControl
{
    self.models         = [[NSMutableArray alloc] init];
    self.ctx            = ctx;
    self.tableView      = tableView;
    self.refreshControl = refreshControl;
    return self;
}

# pragma mark - 重刷tableView
//采用afnetworking3.0
- (void)reloadTableView
{
    //初始化请求路径url
    NSString *urlStr = [[AppUtil getActionUrlInPlistWithKey:@"CategoryAction"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL = [NSURL URLWithString:urlStr];
    
    NSLog(@"url -> %@", urlStr);
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
    {
        if (error)
        {
            NSLog(@"Error: %@", error);
            UIAlertController *alert = [SevenUIAlert initNoticeWithTitle:@"提示" andMsg:error.localizedDescription andBtnTitle:@"OK"];
            [self.ctx presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            //获取json数据
            NSArray *datas = responseObject;
            //清除旧记录
            [self.models removeAllObjects];
            //加载新记录
            for(NSDictionary *data in datas)
            {
                NavModel *o = [[NavModel alloc] init];
                [o initWithData:data];
                [self.models addObject:o];
            }
            //刷新tableView
            [self.tableView reloadData];
        }
        [self.refreshControl endRefreshing];
    }];
    [dataTask resume];
}

//原生API HTTP请求
//- (void)reloadTableView {
//    //初始化请求路径url
//    NSString *urlStr = [[AppUtil getActionUrlInPlistWithKey:@"NavAction"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL    *URL    = [NSURL URLWithString:urlStr];
//    
//    //初始化request
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:URL cachePolicy:0 timeoutInterval:15.0f];
//    //发送异步请求
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        if (connectionError) {
//            NSLog(@"%@",connectionError.localizedDescription);
//        } else {
//            //获取json数据
//            NSArray *datas = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
//            //清除旧记录
//            [self.models removeAllObjects];
//            //加载新记录
//            for(NSDictionary *data in datas) {
//                NavModel *o = [[NavModel alloc] init];
//                [o initWithData:data];
//                [self.models addObject:o];
//            }
//            //刷新tableView
//            [self.tableView reloadData];
//        }
//        [self.refreshControl endRefreshing];
//    }];
//}

@end
