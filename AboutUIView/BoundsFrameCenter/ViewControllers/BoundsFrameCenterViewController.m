//
//  BoundsFrameCenterViewController.m
//  AboutUIView
//
//  Created by mac on 16/12/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "BoundsFrameCenterViewController.h"

@interface BoundsFrameCenterViewController ()

@end

@implementation BoundsFrameCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //因为控制器view是由xib创建的， 只有这个时候sefl.view 才被创建好
    
    //frame
    //    [self p_frame];
    
    
    //bounds
    [self p_bounds];
    
    //center
    //    [self p_center];
}


- (void)p_frame{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
}

- (void)p_bounds{
    //bounds 和center 可以确定一个控件的位置
    //只有bounds时，center 默认是父控件的原点
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 300, 300);
    view.center = self.view.center;
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    
    //bounds
    UIView *orangeView = [UIView new];
    orangeView.bounds = CGRectMake(0, 0, 100, 100);
    orangeView.center = CGPointMake(50, 50);
    orangeView.backgroundColor = [UIColor orangeColor];
    [view addSubview:orangeView];
    
    //记住一点就成，bounds 变化不会影响center 其他的都有可能会影响到
    UIView *greenView = [UIView new];
    greenView.frame = CGRectMake(100, 100, 100, 100);
    greenView.bounds = CGRectMake(0, 0, 200, 200);
    greenView.backgroundColor = [UIColor greenColor];
    [view addSubview:greenView];
    
    UIView *redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 50, 50);
    redView.backgroundColor = [UIColor redColor];
    [view addSubview:redView];
    
    
    
}


- (void)p_center{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    view.center = self.view.center;
    NSLog(@"sefl.view.center = %@",NSStringFromCGPoint(self.view.center));
    NSLog(@"self.view.frame= %@",NSStringFromCGRect(self.view.frame));
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    NSLog(@"point = %@",NSStringFromCGPoint(point));
    NSLog(@"center_x = %f  center_y = %f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
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
