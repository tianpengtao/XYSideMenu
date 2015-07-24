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
@property(nonatomic,assign)CGFloat leftMenuWidth;
@property(nonatomic,strong)UIImageView *alertImageView;
@end


@implementation XYSideMenuView
+ (XYSideMenuView *)containerWithCenterView:(UIView*)centerView
                               leftMenuView:(UIView*)leftMenuView{
    XYSideMenuView *sideMenuView = [[XYSideMenuView alloc] initWithFrame:centerView.bounds];
    sideMenuView.leftMenuView = leftMenuView;
    sideMenuView.centerView = centerView;
    sideMenuView.leftMenuWidth=CGRectGetWidth(leftMenuView.frame);
    
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
        _menuState=XYSideMenuStateClosed;

    }else{
        targetContentOffset->x=0;
        _menuState=XYSideMenuStateLeftMenuOpen;
    }
    [self showOrHiddenAlert];

}
#pragma mark - getters and setters

-(void)setLeftMenuView:(UIView *)leftMenuView{
    _leftMenuView=leftMenuView;
    [_scrollView addSubview:_leftMenuView];
}
-(void)setCenterView:(UIView *)centerView{
    _centerView=centerView;
    [_scrollView addSubview:_centerView];
    
    self.alertImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ab_openAlert"]];
    [_scrollView addSubview:_alertImageView];
}
-(void)setLeftMenuWidth:(CGFloat)leftMenuWidth{
    _leftMenuWidth=leftMenuWidth;
    _leftMenuView.frame=CGRectMake(0, 0, _leftMenuWidth, CGRectGetHeight(self.frame));
    
    _centerView.frame=CGRectMake(_leftMenuWidth, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _scrollView.contentSize=CGSizeMake(_leftMenuWidth+CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _alertImageView.frame=CGRectMake(_leftMenuWidth, (CGRectGetHeight(self.frame)-42.5)/2, 7, 42.5);
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
    [self showOrHiddenAlert];
}
-(void)showOrHiddenAlert{
    switch (_menuState) {
        case XYSideMenuStateClosed:
            _alertImageView.hidden=NO;
            break;
        case XYSideMenuStateLeftMenuOpen:
            _alertImageView.hidden=YES;
            break;
        default:
            break;
    }
}


@end
