//
//  NavViewController.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/15.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    /*--- 设置navigation bar ----------------------------------------------*/
    // 改变状态栏为黑底白字（默认白底黑字）
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    // 背景色
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    // barItem字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // titile标题色
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    self.navigationController.navigationBar.translucent = NO;
    
    /*--- 设置进度圈 -------------------------------------------------------*/
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(reloadTableViewAction) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    
    /*--- 不显示多余的空Cell -------------------------------------------------------*/
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    /*--- 初始化数据 -------------------------------------------------------*/
    self.categoryPresenter = [[CategoryPresenter alloc] initWithCtx:self andTableView:self.tableView andRefreshControl:self.refreshControl];
    [self reloadTableViewAction];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.categoryPresenter.models count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"DataCell";
    CategoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[NavViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//    }
    [cell setWithModel:[self.categoryPresenter.models objectAtIndex:indexPath.row]];
    // 设置分割线长度
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 80, 0, 0)];//分割线设置 上 左 下 右
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    //往ModelViewController传值
    UICollectionViewController *modelViewController=[segue destinationViewController];
    [modelViewController setValue:[self.categoryPresenter.models objectAtIndex:indexPath.row].vId forKey:@"vCategoryId"];
    [modelViewController setValue:[self.categoryPresenter.models objectAtIndex:indexPath.row].vName forKey:@"vCategoryName"];
    [modelViewController setValue:[self.categoryPresenter.models objectAtIndex:indexPath.row].vQty forKey:@"vCategoryQty"];
}

#pragma mark - action
- (void)reloadTableViewAction {
    [self.categoryPresenter reloadTableView];
}
@end
