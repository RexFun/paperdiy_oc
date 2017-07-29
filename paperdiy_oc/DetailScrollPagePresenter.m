//
//  DetailScrollPagePresenter.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailScrollPagePresenter.h"

@implementation DetailScrollPagePresenter

#pragma mark - 初始化presenter
- (id)initWithCtx:(UIViewController *)ctx andScrollView:(UIScrollView *)scrollView andPageControl:(UIPageControl *) pageControl andSubNavId:(NSString *)subNavId andIndexPath:(NSIndexPath *)indexPath
{
    self.models      = [[NSMutableArray alloc] init];
    self.ctx         = ctx;
    self.scrollView  = scrollView;
    self.pageControl = pageControl;
    self.subNavId    = subNavId;
    self.indexPath   = indexPath;
    return self;
}

#pragma mark - 刷新View
- (void)reloadView
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //一定要加这段，否则报错：unacceptable content-type text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    //设参数
    NSDictionary *parameters = @{@"modelId":self.subNavId};
    //发请求
    [manager POST:[AppUtil getActionUrlInPlistWithKey:@"ImageAction"] parameters:parameters
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
                DetailModel *o = [[DetailModel alloc] init];
                [o initWithData:data];
                [self.models addObject:o];
            }
            //刷新View
            [self drawView];
        }
        failure:^(NSURLSessionTask *operation, NSError *error)
        {
            NSLog(@"Error: %@", error);
            UIAlertController *alert = [SevenUIAlert initNoticeWithTitle:@"提示" andMsg:error.localizedDescription andBtnTitle:@"OK"];
            [self.ctx presentViewController:alert animated:YES completion:nil];
        }
    ];
}
// 原生API HTTP请求
//- (void)reloadView {
//    //初始化请求路径url
//    NSString *urlStr = [[AppUtil getActionUrlInPlistWithKey:@"ImageAction"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url       = [NSURL URLWithString:urlStr];
//    //初始化request
//    // 1.
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
//    // 2.
//    [request setHTTPMethod:@"POST"];
//    // 3. 数据体
//    NSString *params = [[NSString alloc] initWithFormat:@"pid=%@", self.subNavId];
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
//            //刷新View
//            [self drawView];
//        }
//    }];
//}

#pragma mark - 绘制scrollView和pageControl
- (void)drawView
{
    //获取屏幕高宽
    CGFloat imageW = self.scrollView.bounds.size.width;
    CGFloat imageH = self.scrollView.bounds.size.height;
    NSLog(@"imageH -> %f",imageH);
    CGFloat imageY = self.scrollView.bounds.origin.y;
    //为scrollView遍历添加子cellView
    for (NSInteger i = 0; i < self.models.count; i++)
    {
        DetailScrollPageViewCell *cell = [[DetailScrollPageViewCell alloc] initWithFrame:CGRectMake(imageW*i, imageY, imageW, imageH)];
        [cell setWithModel: [self.models objectAtIndex:i]];
        [self.scrollView addSubview:cell];
    }
    // 设置scrollView的滚动范围
    self.scrollView.contentSize = CGSizeMake(imageW * self.models.count, imageY);
    // 设置scrollView滚动到指定位置
    [self.scrollView setContentOffset:CGPointMake(self.indexPath.row * imageW, imageY) animated:YES];
    // 设置总页数
    self.pageControl.numberOfPages = self.models.count;
    // 设置当前在第几页
    self.pageControl.currentPage = [self.models objectAtIndex:self.indexPath.row].detailImgSort;
    // 设置srollView的代理
    self.scrollView.delegate = self;
    // 设置title 显示第几步
    [self setCtxTitle:self.pageControl.currentPage];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //如何计算当前滚动到了第几页
    // 1.获取滚动的x方向的偏移量
    CGFloat offsetX = self.scrollView.contentOffset.x;
//    NSLog(@"@offsetX1 -> %@",offsetX);
    offsetX = offsetX + self.scrollView.frame.size.width/2;
//    NSLog(@"@offsetX2 -> %@",offsetX);
    // 2.用x方向的偏移量除以一张图片的宽度，取商就是当前滚动到了第几页
    int index = offsetX/self.scrollView.frame.size.width;
//    NSLog(@"@self.scrollView.frame.size.width -> %@",self.scrollView.frame.size.width);
//    NSLog(@"@index -> %@",index);
    int page = [[self.models objectAtIndex:index].detailImgSort intValue];
    // 3.将页码赋值给UIPageControl
    self.pageControl.currentPage = page-1;
    // 4.title 显示第几步
    [self setCtxTitle:page];
}

#pragma mark - 设置title 显示第几步
- (void) setCtxTitle:(int *)page
{
    self.ctx.title = [NSString stringWithFormat:@"第%i步", page];
}
@end
