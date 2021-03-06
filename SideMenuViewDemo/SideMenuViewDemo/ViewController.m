//
//  ViewController.m
//  SideMenuViewDemo
//
//  Created by 田 on 15/6/26.
//  Copyright (c) 2015年 田. All rights reserved.
//

#import "ViewController.h"
#import "LeftView.h"
#import "CenterView.h"
#import "XYSideMenuView.h"
@interface ViewController ()

@end

@implementation ViewController{
    XYSideMenuView *sideMenuView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat leftMenuWidth=160;
    
    
    
    LeftView *lv=[[LeftView  alloc] initWithFrame:CGRectMake(0, 0, leftMenuWidth, 400)];
    lv.backgroundColor=[UIColor redColor];
    CenterView *cv=[[CenterView  alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    cv.backgroundColor=[UIColor blueColor];
    sideMenuView=[XYSideMenuView containerWithCenterView:cv
                                            leftMenuView:lv];
    sideMenuView.menuState=XYSideMenuStateClosed;
    [self.view addSubview:sideMenuView];
    
    
    UIButton *openButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [openButton setTitle:@"open" forState:UIControlStateNormal];
    openButton.backgroundColor=[UIColor redColor];
    openButton.frame=CGRectMake(0, 410, 50, 30);
    [openButton addTarget:self action:@selector(open) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openButton];
    
    UIButton *closeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setTitle:@"close" forState:UIControlStateNormal];
    closeButton.backgroundColor=[UIColor redColor];
    closeButton.frame=CGRectMake(60, 410, 50, 30);
    [closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:closeButton];
}
-(void)open{
    sideMenuView.menuState=XYSideMenuStateLeftMenuOpen;
}
-(void)close{
     sideMenuView.menuState=XYSideMenuStateClosed;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
