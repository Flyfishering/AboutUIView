//
//  VisualFormatLanguageViewController.m
//  AboutUIView
//
//  Created by mac on 17/3/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VisualFormatLanguageViewController.h"
//语法介绍 http://blog.csdn.net/dongbaojun_ios/article/details/12650831
//http://www.jianshu.com/p/757cc57fd9ea  部分源码来自这个文章

@interface VisualFormatLanguageViewController()
@property (nonatomic, strong) UIView *redView;
@end


@implementation VisualFormatLanguageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    
    [self demoOne];
    [self demoTwo];
    
    
}

- (void)demoOne{
    self.redView = [UIView new];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.redView.backgroundColor =[ UIColor redColor];
    [self.view addSubview:self.redView];
    
    //接下来开始写API所需要的参数了
    //format参数
    //Hvfl与Vvfl分别是水平方向与垂直方向的约束，等下之后会有解析
    //NOTE: 不能写作self.redView, 如果view是控制器的属性，只能写做_redView
    NSString *Hvfl = @"H:|-margin-[RedView(50@100)]-trailing-|";
    NSString *Vvfl = @"V:|-margin-[RedView(100@100)]-trailing-|";
    
    //设置margin的数值
    NSDictionary *metrics = @{@"margin":@100,
                              @"trailing":@100};
    
    //把要添加约束的View转成字典  只能写做_redView (self.redView 会崩溃)
    //NSDictionary *views = NSDictionaryOfVariableBindings(_redView);
    //也可用下面的字典代替上面的字典，给_redView一个自定义的key ,同时format中也要用这个key值来代表要加约束的view
    NSDictionary *views = @{@"RedView":self.redView};
    
    //添加对齐方式   左边与顶部
    NSLayoutFormatOptions ops = NSLayoutFormatAlignAllLeft|NSLayoutFormatAlignAllTop;
    //参数已经设置完了，接收返回的数组，用以self.view添加
    NSArray *Hconstraints = [NSLayoutConstraint constraintsWithVisualFormat:Hvfl options:ops metrics:metrics views:views];
    NSArray *Vconstraints = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl options:ops metrics:metrics views:views];
    [self.view addConstraints:Hconstraints];
    [self.view addConstraints:Vconstraints];
}

- (void)demoTwo{
    //创建三个横向一排view， 三个view距离屏幕底层都是20，之间的间距也是20，最左边的view的距离屏幕的边缘也是20.
    UIView *redView = [UIView new];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *orangeView = [UIView new];
    orangeView.translatesAutoresizingMaskIntoConstraints = NO;
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    
    UIView *grayView = [UIView new];
    grayView.translatesAutoresizingMaskIntoConstraints = NO;
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    
    NSString *Hvfl = @"H:|-margin-[redView(50)]-margin-[orangeView(==redView)]-margin-[grayView(==redView)]";
    NSString *Vvfl_redView = @"V:[redView(50)]-margin-|";
    NSString *Vvfl_orangeView = @"V:[orangeView(==redView)]-margin-|";
    NSString *Vvfl_grayView = @"V:[grayView(==redView)]-margin-|";
    
    NSLayoutFormatOptions ops= NSLayoutFormatAlignAllBottom|NSLayoutFormatAlignAllTop;
    NSDictionary *metrics = @{@"margin":@20};
    NSDictionary *views = @{@"redView":redView,
                            @"orangeView":orangeView,
                            @"grayView":grayView};
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:Hvfl options:ops metrics:metrics views:views];
    
    

    NSArray *constraintV_redView = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl_redView options:ops metrics:metrics views:views];
    //NSArray *constraintV_orangeVeiw = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl_orangeView options:ops metrics:metrics views:views];
    //NSArray *constraintV_grayVeiw = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl_grayView options:ops metrics:metrics views:views];
    [self.view addConstraints:constraintH];
    [self.view addConstraints:constraintV_redView];
    //[self.view addConstraints:constraintV_orangeVeiw];
    //[self.view addConstraints:constraintV_grayVeiw];
/*******
 
 1.H：水平方向   V：垂直方向
 2.|: 父视图的上下左右四个边的某一个
 3.[view]: 子view用[]包含
 4.|[view]|: viwe距离父view边框为零
 5.|-[view]-|: view 距离父view边框为标准距离(self.view 为20 其他view为8)
 6.|-20-[view]|: view距离父view一个边20 ，另一个边0
 7.|-[view(100)]-|:view 的宽或者高是100
 8.|-[view(==redView)]-|: view 的宽或者高等于redVeiw的宽或者高
 9.|-[view(100@200)]-|:   100宽或者高  200优先级
 
 合适的对齐方式，会节省大量的约束条件
 所有约束加在父view上
 */
}

@end
