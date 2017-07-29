//
//  DetailScrollPageViewCell.m
//  paperdiy_oc
//
//  Created by mac373 on 16/2/19.
//  Copyright © 2016年 rexfun. All rights reserved.
//

#import "ImageScrollPageViewCell.h"

@implementation ImageScrollPageViewCell

- (void)setWithModel:(Image *)model {
    //cell加边框颜色
    self.layer.borderWidth = 10.0f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    //设置imageView尺寸
    CGFloat imgW = self.bounds.size.width;
    CGFloat imgH = self.bounds.size.height;
    self.vImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgW, imgH)];
    //设置imageView按比例自适应高宽
    self.vImg.contentMode = UIViewContentModeScaleAspectFit;
    self.vImg.autoresizesSubviews = YES;
    self.vImg.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //读取图片网络数据
    [self.vImg sd_setImageWithURL:model.vImgUrl placeholderImage:[UIImage imageNamed:@"Placeholder.pdf"]];
    //读取图片id
    self.vId = [[UILabel alloc] initWithFrame:CGRectMake(imgW/4, imgH/2, 50, 50)];
    self.vId.text = model.vId;
    [self.vId setHidden: YES];
    //读取图片排序号
    self.vSort = [[UILabel alloc] initWithFrame:CGRectMake(imgW/4, imgH/2+20, 50, 50)];
    self.vSort.text = [NSString stringWithFormat:@"第%@步", model.vSort];
    [self.vSort setHidden: YES];
    
    [self addSubview:self.vImg];
    [self addSubview:self.vId];
    [self addSubview:self.vSort];
}
@end
