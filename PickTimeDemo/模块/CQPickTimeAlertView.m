//
//  CQPickTimeAlertView.m
//  PickTimeDemo
//
//  Created by 蔡强 on 2017/12/27.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "CQPickTimeAlertView.h"
#import "CQPickTimeAlertModel.h"
#import "CQPickTimeAlertItem.h"

@implementation CQPickTimeAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 30)];
    [self addSubview:titleLabel];
    titleLabel.text = @"温馨提示";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor greenColor];
}

- (void)setItemsArray:(NSArray *)itemsArray {
    _itemsArray = itemsArray;
    
    UIView *lastView = nil;
    
    for (int i = 0; i < _itemsArray.count; i ++) {
        CQPickTimeAlertItem *itemView = [[CQPickTimeAlertItem alloc] init];
        [self addSubview:itemView];
        if (!lastView) {
            itemView.frame = CGRectMake(5, 40, self.frame.size.width-10, 0);
        } else {
            itemView.frame = CGRectMake(5, CGRectGetMaxY(lastView.frame) + 5, self.frame.size.width-10, 0);
        }
        itemView.model = _itemsArray[i];
        lastView = itemView;
    }
    
    // 调整自身高度
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(lastView.frame)+10);
    
    // 虚线边框
    CAShapeLayer *imaginaryLine = [CAShapeLayer layer];
    imaginaryLine.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    imaginaryLine.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0].CGPath;
    imaginaryLine.lineWidth = 1. / [[UIScreen mainScreen] scale];
    imaginaryLine.lineDashPattern = @[@2, @2];
    imaginaryLine.fillColor = [UIColor clearColor].CGColor;
    imaginaryLine.strokeColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:imaginaryLine];
}

@end
