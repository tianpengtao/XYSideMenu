//
//  LeftView.m
//  SideMenuViewDemo
//
//  Created by 田 on 15/6/26.
//  Copyright (c) 2015年 田. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor=[UIColor brownColor];
    CGFloat height=50;
    button.frame=CGRectMake(10, CGRectGetHeight(self.frame)-height, CGRectGetWidth(self.frame)-20, height);
    [self addSubview:button];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
