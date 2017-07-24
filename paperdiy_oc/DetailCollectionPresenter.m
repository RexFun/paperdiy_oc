//
//  DetailCollectionPresenter.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailCollectionPresenter.h"

@implementation DetailCollectionPresenter

- (id)initWithCtx:(UIViewController*)ctx andCollectionView:(UICollectionView*)collectionView andSubNavId:(NSString*)subNavId
{
    self.models         = [[NSMutableArray alloc] init];
    self.ctx            = ctx;
    self.collectionView = collectionView;
    self.subNavId       = subNavId;
    return self;
}

- (void)pullDownRefresh
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //一定要加这段，否则报错：unacceptable content-type text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    //设参数
    NSDictionary *parameters = @{@"modelId":self.subNavId, @"offset":@"0", @"limit":@"5"};
    //发请求
    
    NSLog(@"url -> %@, params -> %@",[AppUtil getActionUrlInPlistWithKey:@"DetailCollectionAction"],parameters);
    
    [manager POST:[AppUtil getActionUrlInPlistWithKey:@"DetailCollectionAction"] parameters:parameters
    success:^(NSURLSessionTask *task, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        //获取json数据
        NSArray *datas = responseObject;
        if(datas.count > 0)
        {
            //清除旧记录
            [self.models removeAllObjects];
            //加载新记录
            for(NSDictionary *data in datas)
            {
                DetailModel *o = [[DetailModel alloc] init];
                [o initWithData:data];
                [self.models addObject:o];
            }
            //刷新tableView
            [self.collectionView reloadData];
        }
        else
        {
            //全部加载完毕
            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        }
    }
    failure:^(NSURLSessionTask *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
        UIAlertController *alert = [SevenUIAlert initNoticeWithTitle:@"提示" andMsg:error.localizedDescription andBtnTitle:@"OK"];
        [self.ctx presentViewController:alert animated:YES completion:nil];
    }];
}

- (void)pullUpRefresh
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //一定要加这段，否则报错：unacceptable content-type text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    //设参数
    NSDictionary *parameters = @{@"modelId":self.subNavId, @"offset":[NSNumber numberWithLong:self.models.count], @"limit":@"5"};
    //发请求
    [manager POST:[AppUtil getActionUrlInPlistWithKey:@"DetailCollectionAction"] parameters:parameters
    success:^(NSURLSessionTask *task, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        //获取json数据
        NSArray *datas = responseObject;
        if(datas.count > 0)
        {
         //加载新记录
         for(NSDictionary *data in datas) {
             DetailModel *o = [[DetailModel alloc] init];
             [o initWithData:data];
             [self.models addObject:o];
         }
         //刷新tableView
         [self.collectionView reloadData];
        }
        else
        {
         //全部加载完毕
         [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        }
    }
    failure:^(NSURLSessionTask *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
        UIAlertController *alert = [SevenUIAlert initNoticeWithTitle:@"提示" andMsg:error.localizedDescription andBtnTitle:@"OK"];
        [self.ctx presentViewController:alert animated:YES completion:nil];
    }];
}

// 原生API HTTP请求
//- (void)reloadCollectionView {
//    //初始化请求路径url
//    NSString *urlStr = [[AppUtil getActionUrlInPlistWithKey:@"DetailCollectionAction"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url       = [NSURL URLWithString:urlStr];
//    //初始化request
//    // 1.
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
//    // 2.
//    [request setHTTPMethod:@"POST"];
//    // 3. 数据体
//    NSString *params = [[NSString alloc] initWithFormat:@"pid=%@&rownum=%@&pagesize=%@", self.subNavId, @"0" ,@"100"];
//    // 4. 将字符串转换成数据
//    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    [request setHTTPBody:postData];
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
//                DetailModel *o = [[DetailModel alloc] init];
//                [o initWithData:data];
//                [self.models addObject:o];
//            }
//            //刷新tableView
//            [self.collectionView reloadData];
//        }
//        //        [self.refreshControl endRefreshing];
//    }];
//}

@end
