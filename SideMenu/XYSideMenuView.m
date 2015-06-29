//
//  XYSideMenuView.m
//  SideMenuViewDemo
//
//  Created by 田 on 15/6/26.
//  Copyright (c) 2015年 田. All rights reserved.
//

#import "XYSideMenuView.h"
@interface XYSideMenuView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@end
@implementation XYSideMenuView
+ (XYSideMenuView *)containerWithCenterView:(id)centerView
                               leftMenuView:(id)leftMenuView
                                      frame:(CGRect)frame{
    XYSideMenuView *sideMenuView = [[XYSideMenuView alloc] initWithFrame:frame];
    sideMenuView.leftMenuView = leftMenuView;
    sideMenuView.centerView = centerView;
    return sideMenuView;
}
#pragma mark - life cycle
- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setupUI];
    }
    return self;
}
#pragma mark - UI

-(void)setupUI{
    self.scrollView=[[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate=self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator=NO;

    [self addSubview:_scrollView];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat offsetX=_scrollView.contentOffset.x;
    if (offsetX>=_leftMenuWidth/2) {
        targetContentOffset->x=_leftMenuWidth;
    }else{
        targetContentOffset->x=0;
    }
}
#pragma mark - getters and setters

-(void)setLeftMenuView:(UIView *)leftMenuView{
    _leftMenuView=leftMenuView;
    [_scrollView addSubview:_leftMenuView];
}
-(void)setCenterView:(UIView *)centerView{
    _centerView=centerView;
    [_scrollView addSubview:_centerView];
}
-(void)setLeftMenuWidth:(CGFloat)leftMenuWidth{
    _leftMenuWidth=leftMenuWidth;
    _leftMenuView.frame=CGRectMake(0, 0, _leftMenuWidth, CGRectGetHeight(self.frame));
    
    _centerView.frame=CGRectMake(_leftMenuWidth, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _scrollView.contentSize=CGSizeMake(_leftMenuWidth+CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}
-(void)setMenuState:(XYSideMenuState)menuState{
    _menuState=menuState;
    switch (_menuState) {
        case XYSideMenuStateClosed:
            [_scrollView setContentOffset:CGPointMake(_leftMenuWidth, 0) animated:YES];
            break;
        case XYSideMenuStateLeftMenuOpen:
            [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        default:
            break;
    }
}



@end
