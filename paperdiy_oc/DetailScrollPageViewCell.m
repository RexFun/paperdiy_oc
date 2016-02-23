//
//  DetailScrollPageViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "DetailScrollPageViewCell.h"

@implementation DetailScrollPageViewCell

- (void)setWithModel:(DetailModel *)model {
    //cell加边框颜色
    self.layer.borderWidth = 10.0f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    //设置imageView尺寸
    CGFloat imgW = self.bounds.size.width;
    CGFloat imgH = self.bounds.size.height;
    self.detailImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgW, imgH)];
    //设置imageView按比例自适应高宽
    self.detailImgView.contentMode = UIViewContentModeScaleAspectFit;
    self.detailImgView.autoresizesSubviews = YES;
    self.detailImgView.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //读取图片网络数据
    NSString *imgUrlStr = [NSString stringWithFormat:[AppUtil getActionUrlInPlistWithKey:@"DetailImgAction"], model.detailImgId];
    NSURL    *imgUrl    = [NSURL URLWithString:imgUrlStr];
    NSData   *imgData   = [NSData dataWithContentsOfURL:imgUrl];
    self.detailImgView.image = [UIImage imageWithData:imgData];
    //读取图片id
    self.detailImgId = [[UILabel alloc] initWithFrame:CGRectMake(imgW/4, imgH/2, 50, 50)];
    self.detailImgId.text = model.detailImgId;
    [self.detailImgId setHidden: YES];
    //读取图片排序号
    self.detailImgSort = [[UILabel alloc] initWithFrame:CGRectMake(imgW/4, imgH/2+20, 50, 50)];
    self.detailImgSort.text = [NSString stringWithFormat:@"第%@步", model.detailImgSort];
    [self.detailImgSort setHidden: YES];
    
    [self addSubview:self.detailImgView];
    [self addSubview:self.detailImgId];
    [self addSubview:self.detailImgSort];
}
@end
