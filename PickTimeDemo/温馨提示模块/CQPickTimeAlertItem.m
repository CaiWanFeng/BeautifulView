//
//  CQPickTimeAlertItem.m
//  PickTimeDemo
//
//  Created by 蔡强 on 2017/12/27.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "CQPickTimeAlertItem.h"

@interface CQPickTimeAlertItem ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation CQPickTimeAlertItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.titleLabel.textColor = [UIColor redColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.layer.cornerRadius = 3;
    self.titleLabel.layer.borderWidth = 1;
    self.titleLabel.layer.borderColor = [UIColor redColor].CGColor;
    
    self.descLabel = [[UILabel alloc] init];
    [self addSubview:self.descLabel];
    self.descLabel.font = [UIFont systemFontOfSize:12];
    self.descLabel.textColor = [UIColor orangeColor];
    self.descLabel.numberOfLines = 0;
    
    [self bringSubviewToFront:self.titleLabel];
}

- (void)setModel:(CQPickTimeAlertModel *)model {
    _model = model;
    
    self.titleLabel.text = _model.title;
    self.descLabel.text  = _model.desc;
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.frame.size.width + 6, self.titleLabel.frame.size.height + 2);
    
    // 设置富文本：首行缩进
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.firstLineHeadIndent = self.titleLabel.frame.size.width + 4;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.descLabel.text];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.titleLabel.text.length)];
    
    self.descLabel.attributedText = attrString;
    
    self.descLabel.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    [self.descLabel sizeToFit];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(self.descLabel.frame));
}

@end
