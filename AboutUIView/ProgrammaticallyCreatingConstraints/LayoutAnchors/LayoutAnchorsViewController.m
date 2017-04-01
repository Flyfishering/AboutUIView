//
//  LayoutAnchorsViewController.m
//  AboutUIView
//
//  Created by mac on 17/3/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LayoutAnchorsViewController.h"
@interface LayoutAnchorsViewController()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *orangeViwe;
@property (nonatomic, strong) UIView *ligGrayView;
@property (nonatomic, strong) UIView *purpleView;
@end

@implementation LayoutAnchorsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = [UIScreen mainScreen].bounds;
    //1.宽高相等的两个view
    self.redView = [[UIView alloc] init];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.redView];
    
    self.orangeViwe = [[UIView alloc] init];
    self.orangeViwe.translatesAutoresizingMaskIntoConstraints = NO;
    self.orangeViwe.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.orangeViwe];
    
    //2.第一个view 是第二个view 的宽度的两倍
    self.ligGrayView = [UIView new];
    self.ligGrayView.translatesAutoresizingMaskIntoConstraints = NO;
    self.ligGrayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.ligGrayView];
    
    self.purpleView = [UIView new];
    self.purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    self.purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.purpleView];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
   
    //第一行
    UILayoutGuide *marginGuide = self.view.layoutMarginsGuide;
    NSLayoutConstraint  *constrain1 = [self.redView.leadingAnchor constraintEqualToAnchor:marginGuide.leadingAnchor];
    NSLayoutConstraint  *constrain2 = [self.redView.widthAnchor constraintEqualToAnchor:self.orangeViwe.widthAnchor multiplier:1.0];
    NSLayoutConstraint  *constrain3 = [self.orangeViwe.leadingAnchor constraintEqualToAnchor:self.redView.trailingAnchor];
    NSLayoutConstraint  *constrain4 = [self.orangeViwe.trailingAnchor constraintEqualToAnchor:marginGuide.trailingAnchor];
    NSLayoutConstraint  *constrain5 = [self.redView.topAnchor constraintEqualToAnchor:marginGuide.topAnchor constant:80];
    NSLayoutConstraint  *constrain6 = [self.orangeViwe.topAnchor constraintEqualToAnchor:self.redView.topAnchor];
    NSLayoutConstraint *constrain7 = [self.redView.heightAnchor constraintEqualToConstant:100];
    NSLayoutConstraint *constrain8 = [self.orangeViwe.heightAnchor constraintEqualToConstant:100];
//    [NSLayoutConstraint activateConstraints:@[constrain1,constrain2,constrain3,constrain4,constrain5,constrain6,constrain7,constrain8]];
    
    constrain1.active = YES;
    constrain2.active = YES;
    constrain3.active = YES;
    constrain4.active = YES;
    constrain5.active = YES;
    constrain6.active = YES;
    constrain7.active = YES;
    constrain8.active = YES;
    
    //第二行
        //V:
    NSLayoutConstraint *constrain11 = [self.ligGrayView.topAnchor constraintEqualToAnchor:self.redView.bottomAnchor constant:20];
    NSLayoutConstraint *constrain12 = [self.ligGrayView.heightAnchor constraintEqualToConstant:100];
    //H：
    NSLayoutConstraint *constrain13 = [self.ligGrayView.leadingAnchor constraintEqualToAnchor:marginGuide.leadingAnchor constant:0];
    NSLayoutConstraint *constrain14 = [self.ligGrayView.widthAnchor constraintEqualToAnchor:self.purpleView.widthAnchor multiplier:2.0];
    //V:
    NSLayoutConstraint *constrain15 = [self.purpleView.topAnchor constraintEqualToAnchor:self.ligGrayView.topAnchor];
    NSLayoutConstraint *constrain16 = [self.purpleView.heightAnchor constraintEqualToAnchor:self.ligGrayView.heightAnchor multiplier:1.0];
    //H:
    NSLayoutConstraint *constrain17 = [self.purpleView.leadingAnchor constraintEqualToAnchor:self.ligGrayView.trailingAnchor constant:20];
    NSLayoutConstraint *constrain18 = [self.purpleView.trailingAnchor constraintEqualToAnchor:marginGuide.trailingAnchor];
    
    [NSLayoutConstraint activateConstraints:@[constrain11,constrain12,constrain13,constrain14,constrain15,constrain16,constrain17,constrain18]];
    
}
@end
