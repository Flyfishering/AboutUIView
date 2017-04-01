//
//  AutoLayout_LFLViewController.m
//  AboutUIView
//
//  Created by mac on 16/12/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AutoLayout_VFLViewController.h"

@interface AutoLayout_VFLViewController ()

@end

@implementation AutoLayout_VFLViewController

- (void)viewDidLoad {
    
    
    
//    代码说明 http://www.cocoachina.com/ios/20141209/10549.html
    [super viewDidLoad];


    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints=NO;
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    
//    VFL语法
//         H:   |    -   [button]  -  |
//    水平方向: 父控件 20  button   20  父控件
// 水平方向 当父控件和子控件的间距为空时，默认是20
    
//         H:   |    -100- [button]-  |
//    水平方向： 父控件  100   button 20 父控件
    
    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[button]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
  
    
//         V:   |    -   [button(>=50)]
//    垂直方向: 父控件  0   button的高度大于等于50
//    垂直方向 当父控件和子控件的间距 为空时，默认为零
    
    
    
    
//    Format：VFL语法
//    options：枚举
//    metrics：度量
//    views：  关联的所有view
    
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button(>=50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    
//    约束是加在父控件上的
    [self.view addConstraints:constraints1];
    
    [self.view addConstraints:constraints2];
    
    
    UIButton *button1=[[UIButton alloc]init];
    button1.translatesAutoresizingMaskIntoConstraints=NO;
    [button1 setTitle:@"请不要点击我" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button1];
    
    NSArray *constraints3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button1)];
    
    //    V : [button]  -50-  [button1(==30)]
    //垂直方向：button底部 +50   button1高度 = 30
    
//        V : [button]  -  [button1(==30)]
//    垂直方向：button底部 +8 button1高度=30
//   垂直方向  当button 和button之间 间距没有值时，默认是8
    
    
    
    //NSDictionaryOfVariableBindings 中button 和button1的顺序可以调整
//    NSArray *constraints4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-50-[button1(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button,button1)];
    
    
    //同上
    NSArray *constraints4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-[button1(==height)]" options:0 metrics:@{@"height":@30} views:NSDictionaryOfVariableBindings(button1,button)];
    
    
    [self.view addConstraints:constraints3];
    [self.view addConstraints:constraints4];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
//    UIButton *button=[[UIButton alloc] init];
//    [button setTitle:@"点击一下" forState:UIControlStateNormal];
//    button.translatesAutoresizingMaskIntoConstraints=NO;
//    [button setBackgroundColor:[UIColor blackColor]];
//    [self.view addSubview:button];
//    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|"options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
//    
//    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
//    
//    [self.view addConstraints:constraints1];
//    [self.view addConstraints:constraints2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
