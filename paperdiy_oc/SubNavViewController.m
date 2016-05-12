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
//    //加边框颜色
//    cell.layer.borderWidth = 1.0f;
//    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //圆角
    cell.layer.cornerRadius = 7;
    cell.contentView.layer.cornerRadius = 7.0f;
    cell.contentView.layer.borderWidth = 0.7f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    //阴影
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(2,2);
    cell.layer.shadowRadius = 2.0f;
    cell.layer.shadowOpacity = 0.4f;
    cell.layer.masksToBounds = NO;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    //背景
    [cell setBackgroundColor:[UIColor lightGrayColor]];
    //从model装载数据
    [cell setWithModel:[self.subNavPresenter.models objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//  设置每个元素大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = rect.size.width;
    CGFloat cellWidth = screenWidth - 25;
    CGFloat cellHeight = cellWidth * 0.8 + 25;
    return CGSizeMake(cellWidth, cellHeight);
    
}

//  定义每个元素的margin(边缘 上-左-下-右)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}
//
////  定义单元格所在行line之间的距离,前一行和后一行的距离
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    
//    return 20;
//}
//
////  定义每个单元格相互之间的距离
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//    return 0;  
//    
//}
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
