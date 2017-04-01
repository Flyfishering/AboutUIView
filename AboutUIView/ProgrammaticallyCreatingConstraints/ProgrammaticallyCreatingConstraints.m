//
//  ProgrammaticallyCreatingConstraints.m
//  AboutUIView
//
//  Created by mac on 17/3/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ProgrammaticallyCreatingConstraints.h"
#import "LayoutAnchorsViewController.h"
#import "NSLayoutConstraintViewController.h"
#import "VisualFormatLanguageViewController.h"
@implementation ProgrammaticallyCreatingConstraints

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (IBAction)LayoutAnchorsAction:(id)sender{
    LayoutAnchorsViewController *vc = [LayoutAnchorsViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)NSLayoutConstraintAction:(id)sender{
    NSLayoutConstraintViewController *vc = [NSLayoutConstraintViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)VisualFormatLanguageAction:(id)sender{
    VisualFormatLanguageViewController *vc = [VisualFormatLanguageViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
