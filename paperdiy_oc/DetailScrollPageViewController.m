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

//捕捉屏幕旋转，修改ScrollView contentSize
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self reloadViewAction];
    /*****************************************
     if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
     upLabel.frame = upFrame;
     downLabel.frame = dowmFrame;
     }
     else {
     upLabel.frame = CGRectMake(90, 10, 300, 100);
     downLabel.frame = CGRectMake(90, 190, 300, 100);
     }
     *****************************************/
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        
        
//        self.view = portrait;
//        
//        upLabel.frame = upFrame;
//        downLabel.frame = dowmFrame;
//        [self setView:backgroundView];
//        [self.view addSubview:upLabel];
//        [self.view addSubview:downLabel];
//        self.view.transform = CGAffineTransformIdentity;
//        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
//        self.view.bounds = CGRectMake(0, 0, 320, 460);
        NSLog(@"----------->down");
    }
    else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        
//        self.view = landscape;
//        
//        upLabel.frame = CGRectMake(90, 10, 300, 100);
//        downLabel.frame = CGRectMake(90, 190, 300, 100);
//        
//        [self setView:backgroundView];
//        [self.view addSubview:upLabel];
//        [self.view addSubview:downLabel];
//        
//        //        需要修改transfom属性，此处是回复默认状态，每次变换前都要置位，不然你变换用的坐标系统不是屏幕坐标系统（即绝对坐标系统），而是上一次变换后的坐标系统
//        self.view.transform = CGAffineTransformIdentity;
//        //        获取旋转弧度数
//        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
//        self.view.bounds = CGRectMake(0, 0, 480, 300);
        NSLog(@"----------->Left");
    }
    else if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
//        self.view = portrait;
//        
//        
//        upLabel.frame = upFrame;
//        downLabel.frame = dowmFrame;
//        [self setView:backgroundView];
//        [self.view addSubview:upLabel];
//        [self.view addSubview:downLabel];
//        
//        self.view.transform = CGAffineTransformIdentity;
//        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
//        self.view.bounds = CGRectMake(0, 0,320 , 460);
        NSLog(@"----------->up");
    }
    else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
//        self.view = landscape;
//        
//        upLabel.frame = CGRectMake(90, 10, 300, 100);
//        downLabel.frame = CGRectMake(90, 190, 300, 100);
//        [self setView:backgroundView];
//        [self.view addSubview:upLabel];
//        [self.view addSubview:downLabel];
//        
//        self.view.transform = CGAffineTransformIdentity;
//        self.view.transform  = CGAffineTransformMakeRotation(degreesToRadians(90));
//        self.view.bounds = CGRectMake(0, 0, 480, 300);
        
        
        NSLog(@"----------->right");
    }
}
@end
