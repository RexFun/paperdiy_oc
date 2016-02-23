//
//  DetailPageViewController.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailScrollPageViewController.h"

@interface DetailScrollPageViewController ()

@end

@implementation DetailScrollPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化界面
- (void)initView {
    //设置navigationItem
    [self.navigationItem.backBarButtonItem setTitle:@"返回"];
    //初始化presenter
    self.detailScrollPagePresenter = [[DetailScrollPagePresenter alloc] initWithCtx:self andScrollView:self.imgScrollView andPageControl:self.imgPageControl andSubNavId:_subNavId andIndexPath:_indexPath];
    //刷新界面
    [self reloadViewAction];
}

#pragma mark - action
- (void) reloadViewAction {
    [self.detailScrollPagePresenter reloadView];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
