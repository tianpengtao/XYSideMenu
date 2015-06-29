//
//  XYSideMenuView.h
//  SideMenuViewDemo
//
//  Created by 田 on 15/6/26.
//  Copyright (c) 2015年 田. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    XYSideMenuStateClosed,
    XYSideMenuStateLeftMenuOpen
} XYSideMenuState;
@interface XYSideMenuView : UIView
@property (nonatomic, assign) CGFloat leftMenuWidth;
@property(nonatomic,strong)UIView *leftMenuView;
@property(nonatomic,strong)UIView *centerView;
@property (nonatomic, assign) XYSideMenuState menuState;

+ (XYSideMenuView *)containerWithCenterView:(id)centerView
                               leftMenuView:(id)leftMenuView
                                      frame:(CGRect)frame;
@end
