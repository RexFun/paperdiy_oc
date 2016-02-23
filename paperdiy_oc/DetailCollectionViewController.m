//
//  DetailCollectionViewController.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailCollectionViewController.h"

@interface DetailCollectionViewController ()

@end

@implementation DetailCollectionViewController

static NSString * const reuseIdentifier = @"DataCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.detailCollectionPresenter.models count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //获取Cell对象
    DetailCollectionViewCell *cell = (DetailCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //加边框颜色
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //从model装载数据
    [cell setWithModel:[self.detailCollectionPresenter.models objectAtIndex:indexPath.row]];
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

#pragma mark - 初始化界面
- (void)initView {
    //设置Title
    self.title = _subNavName;
    //    //初始化并显示进度圈
    //    self.refreshControl = [[UIRefreshControl alloc] init];
    //    [self.refreshControl addTarget:self action:@selector(reloadTableViewAction) forControlEvents:UIControlEventValueChanged];
    //    [self.refreshControl beginRefreshing];
    //初始化数据
    self.detailCollectionPresenter = [[DetailCollectionPresenter alloc] initWithCollectionView:self.collectionView andSubNavId:_subNavId];
    [self reloadCollectionViewAction];
}

#pragma mark - action
- (void)reloadCollectionViewAction {
    [self.detailCollectionPresenter reloadCollectionView];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //获取被点击的Cell的IndexPath
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    //往DetailScrollPageViewController传值
    UIViewController *detailScrollPageViewController = [segue destinationViewController];
    [detailScrollPageViewController setValue:self.subNavId forKey:@"subNavId"];
    [detailScrollPageViewController setValue:self.subNavName forKey:@"subNavName"];
    [detailScrollPageViewController setValue:[self.detailCollectionPresenter.models objectAtIndex:indexPath.row].detailImgId forKey:@"detailImgId"];
    [detailScrollPageViewController setValue:[self.detailCollectionPresenter.models objectAtIndex:indexPath.row].detailImgPid forKey:@"detailImgPid"];
    [detailScrollPageViewController setValue:[self.detailCollectionPresenter.models objectAtIndex:indexPath.row].detailImgSort forKey:@"detailImgSort"];
    [detailScrollPageViewController setValue:indexPath forKey:@"indexPath"];
    
}

@end
