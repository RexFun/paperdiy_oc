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

- (void)viewWillDisappear:(BOOL)animated {
    // 恢复显示导航栏
    if ([self.navigationController.navigationBar isHidden]) {
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFade;
        animation.duration = 0.4;
        [self.navigationController.navigationBar.layer addAnimation:animation forKey:nil];
        self.navigationController.navigationBar.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 滑动scrollView，并且手指离开时执行。一次有效滑动，只执行一次。 当pagingEnabled属性为YES时，不调用，该方法
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"%f",velocity.y);
    if (velocity.y > 0.0) {
        //向上滑动隐藏导航栏
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFade;
        animation.duration = 0.4;
        [self.navigationController.navigationBar.layer addAnimation:animation forKey:nil];
        self.navigationController.navigationBar.hidden = YES;
    } else {
        //向下滑动显示导航栏
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFade;
        animation.duration = 0.4;
        [self.navigationController.navigationBar.layer addAnimation:animation forKey:nil];
        self.navigationController.navigationBar.hidden = NO;
    }
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
    [cell setWithModel:[self.detailCollectionPresenter.models objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//  设置每个元素大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = rect.size.width;
    CGFloat cellWidth = screenWidth - 25;
    CGFloat cellHeight = cellWidth * 0.8 + 50;
    return CGSizeMake(cellWidth, cellHeight);

}

//  定义每个元素的margin(边缘 上-左-下-右)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(10, 10, 10, 10);

}

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
    //初始化数据
    self.detailCollectionPresenter = [[DetailCollectionPresenter alloc] initWithCollectionView:self.collectionView andSubNavId:_subNavId];
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

#pragma mark - action
- (void)pullDownRefreshAction {
    [self.detailCollectionPresenter pullDownRefresh];
}
#pragma mark - action
- (void)pullUpRefreshAction {
    [self.detailCollectionPresenter pullUpRefresh];
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
