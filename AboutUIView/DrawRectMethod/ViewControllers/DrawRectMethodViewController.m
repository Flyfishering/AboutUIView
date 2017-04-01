//
//  DrawRectMethodViewController.m
//  AboutUIView
//
//  Created by mac on 16/12/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DrawRectMethodViewController.h"
#import "DrawRectDemoOneView.h"
@interface DrawRectMethodViewController ()
@property (nonatomic, strong) DrawRectDemoOneView *oneView;

@end

@implementation DrawRectMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.oneView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




#pragma mark - getter setter 

- (DrawRectDemoOneView *)oneView{
    if (!_oneView) {
        _oneView = [DrawRectDemoOneView new];
        _oneView.frame = CGRectMake(0, 0, 100, 100);
        _oneView.center = self.view.center;
    }
    return _oneView;
}

@end
