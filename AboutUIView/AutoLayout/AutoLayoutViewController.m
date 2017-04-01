//
//  AutoLayoutViewController.m
//  AboutUIView
//
//  Created by mac on 17/3/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectZero];
    backView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:backView];
//    //添加约束
//   
    [NSLayoutConstraint activateConstraints:
                        @[ [backView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
                           [backView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                           [backView.widthAnchor constraintEqualToConstant:200 ],
                           [backView.heightAnchor constraintEqualToConstant:200]]
     ];
//
//    
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    titleLabel.text = @"广东省 深圳市";
//    titleLabel.backgroundColor = [UIColor orangeColor];
//    titleLabel.textColor = [UIColor whiteColor];
//    [backView addSubview:titleLabel];
//    
//    
//    
//    
//    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    subTitleLabel.text = @"2017-03-08";
//    subTitleLabel.textColor = [UIColor whiteColor];
//    subTitleLabel.backgroundColor = [UIColor blueColor];
//    [backView addSubview:subTitleLabel];
//    
//    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)];
//    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[subTitleLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(subTitleLabel)];
//    NSArray *constraints3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-[subTitleLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel,subTitleLabel)];
//    [self.view addConstraints:constraints1];
//    [self.view addConstraints:constraints2];
//    [self.view addConstraints:constraints3];
    
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
