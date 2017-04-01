//
//  ConvertingCoordinatesViewController.m
//  AboutUIView
//
//  Created by mac on 17/3/17.
//  Copyright © 2017年 mac. All rights reserved.
//

/**
 *这个例子 主要是在子view 旋转之后 子view上的点转换为父视图上的坐标，和不旋转转成父视图坐标系上的点会不会有不同。
 *经过验证，是不同的。。。。经过旋转之后 旋转视图的坐标在父视图上回发生变化
 *
 */
#import "ConvertingCoordinatesViewController.h"

static NSString *title = @"设置";

@interface ConvertingCoordinatesViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *orangeView;
@property (nonatomic, strong) NSString *name;
@end

@implementation ConvertingCoordinatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(72, 256, 200, 200)];
//    self.redView.transform = CGAffineTransformMakeRotation(M_PI_4);
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.orangeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.orangeView.backgroundColor = [UIColor orangeColor];
    [self.redView addSubview:self.orangeView];
    
    //convert coordinate
    CGPoint redOriginPoint = [self.redView convertPoint:CGPointMake(0, 0) toView:self.view];
    CGPoint orangePoint = [self.orangeView convertPoint:CGPointMake(0, 0) toView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(redOriginPoint));
    NSLog(@"%@",NSStringFromCGPoint(orangePoint));
    
    
    UIButton *rotaButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 80, 40, 40)];
    [rotaButton setTitle:@"旋转" forState:UIControlStateNormal];
    [rotaButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rotaButton setTitle:@"复原" forState:UIControlStateSelected];
    [rotaButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [rotaButton addTarget:self action:@selector(rotaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rotaButton];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
   
    
    
}

- (void)rotaButtonClick:(UIButton *)button{
    [self.view setNeedsLayout];
    NSLog(@"==========before rotal=======");
    CGPoint redOriginPoint = [self.redView convertPoint:CGPointMake(0, 0) toView:self.view];
    CGPoint orangePoint = [self.orangeView convertPoint:CGPointMake(0, 0) toView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(redOriginPoint));
    NSLog(@"%@",NSStringFromCGPoint(orangePoint));
    
    if (!button.selected) {
        button.selected = YES;
        self.redView.transform = CGAffineTransformMakeRotation(M_PI_4);
        NSLog(@"============after rotl========");
        NSLog(@"%@",NSStringFromCGPoint(redOriginPoint));
        NSLog(@"%@",NSStringFromCGPoint(orangePoint));
    }else{
        button.selected = NO;
        NSLog(@"==========recovery=========");
        self.redView.transform = CGAffineTransformMakeRotation(0);
        NSLog(@"%@",NSStringFromCGPoint(redOriginPoint));
        NSLog(@"%@",NSStringFromCGPoint(orangePoint));
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
