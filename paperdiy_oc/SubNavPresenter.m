//
//  SubNavPresenter.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "SubNavPresenter.h"

@implementation SubNavPresenter

- (id)initWithCollectionView:(UICollectionView *)collectionView andNavId:(NSString *)navId
{
    self.models         = [[NSMutableArray alloc] init];
    self.collectionView = collectionView;
    self.navId          = navId;
    return self;
}

- (void)reloadCollectionView
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //一定要加这段，否则报错：unacceptable content-type text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    //设参数
    NSDictionary *parameters = @{@"pid":self.navId, @"rownum":@"0", @"pagesize":@"5"};
    //发请求
    [manager POST:[AppUtil getActionUrlInPlistWithKey:@"SubNavAction"] parameters:parameters
    success:^(NSURLSessionTask *task, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        //获取json数据
        NSArray *datas = responseObject;
        //清除旧记录
        [self.models removeAllObjects];
        //加载新记录
        for(NSDictionary *data in datas)
        {
            SubNavModel *o = [[SubNavModel alloc] init];
            [o initWithData:data];
            [self.models addObject:o];
        }
        //刷新tableView
        [self.collectionView reloadData];

    }
    failure:^(NSURLSessionTask *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
    }];
}
//原生API HTTP请求
//- (void)reloadCollectionView {
//    //初始化请求路径url
//    NSString *urlStr = [[AppUtil getActionUrlInPlistWithKey:@"SubNavAction"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url       = [NSURL URLWithString:urlStr];
//    //初始化request
//    // 1.
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
//    // 2.
//    [request setHTTPMethod:@"POST"];
//    // 3. 数据体
//    NSString *params = [[NSString alloc] initWithFormat:@"pid=%@&rownum=%@&pagesize=%@", self.navId, @"0" ,@"5"];
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
//                SubNavModel *o = [[SubNavModel alloc] init];
//                [o initWithData:data];
//                [self.models addObject:o];
//            }
//            //刷新tableView
//            [self.collectionView reloadData];
//        }
////        [self.refreshControl endRefreshing];
//    }];
//    
//}

@end
