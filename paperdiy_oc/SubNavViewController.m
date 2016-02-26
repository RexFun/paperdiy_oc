//
//  SubNavViewController.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/17.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "SubNavViewController.h"

@interface SubNavViewController ()

@end

@implementation SubNavViewController

static NSString * const reuseIdentifier = @"DataCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    //设置Title
    self.title = _navName;
    //初始化数据
    self.subNavPresenter = [[SubNavPresenter alloc] initWithCollectionView:self.collectionView andNavId:_navId];
    //下拉刷新
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^
                                     {
                                         [self pullDownRefreshAction];
                                         [self.collectionView.mj_header endRefreshing];
                                     }];
    //上拉刷新
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^
                                     {
                                         [self pullUpRefreshAction];
                                         [self.collectionView.mj_footer endRefreshing];
                                     }];
    [self.collectionView.mj_header beginRefreshing];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //获取被点击的Cell的IndexPath
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    //往DetailCollectionViewController传值
    UICollectionViewController *detailCollectionViewController = [segue destinationViewController];
    [detailCollectionViewController setValue:[self.subNavPresenter.models objectAtIndex:indexPath.row].subNavId forKey:@"subNavId"];
    [detailCollectionViewController setValue:[self.subNavPresenter.models objectAtIndex:indexPath.row].subNavName forKey:@"subNavName"];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.subNavPresenter.models count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //获取Cell对象
    SubNavViewCell *cell = (SubNavViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //加边框颜色
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //从model装载数据
    [cell setWithModel:[self.subNavPresenter.models objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


#pragma mark - action
- (void)pullDownRefreshAction {
    [self.subNavPresenter pullDownRefresh];
}

#pragma mark - action
- (void)pullUpRefreshAction {
    [self.subNavPresenter pullUpRefresh];
}

@end
