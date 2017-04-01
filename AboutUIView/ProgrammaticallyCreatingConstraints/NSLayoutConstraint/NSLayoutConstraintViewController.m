//
//  NSLayoutConstraintViewController.m
//  AboutUIView
//
//  Created by mac on 17/3/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSLayoutConstraintViewController.h"

@interface NSLayoutConstraintViewController ()

@end


@implementation NSLayoutConstraintViewController
- (void)viewDidLoad{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    logoImageView.backgroundColor = [UIColor lightGrayColor];
    logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:logoImageView];
    //左边
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:0];
    //右
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailingMargin multiplier:1.0 constant:0];
    
    //上
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:100];
    //高
    NSLayoutConstraint *heighConstraint = [NSLayoutConstraint constraintWithItem:logoImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:100];
    //iOS 6.0或者7.0调用addConstraints
    //    [self.view addConstraints:@[leftConstraint, rightConstraint, topConstraint, heightConstraint]];
    
    //iOS 8.0以后设置active属性值
    leadingConstraint.active = YES;
    trailingConstraint.active = YES;
    topConstraint.active = YES;
    heighConstraint.active = YES;
    
    //MARK:scrollView的子视图 约束都要和scrollview相关联，方便scrollview计算contentSize
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
//    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
    //左
    NSLayoutConstraint *scrollViewLeadingConstraint = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeLeadingMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:0];
    //右
    NSLayoutConstraint *scrollViewTraillingConstraint = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeTrailingMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailingMargin multiplier:1.0 constant:0];
    //顶
    NSLayoutConstraint *scrollViewTopConstraint = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:logoImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    //底
    NSLayoutConstraint *scrollviewBottom = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    [NSLayoutConstraint activateConstraints:@[scrollViewLeadingConstraint,scrollViewTraillingConstraint,scrollViewTopConstraint,scrollviewBottom]];
    
    UILabel *namelabel = [UILabel new];
    namelabel.translatesAutoresizingMaskIntoConstraints = NO;
    namelabel.backgroundColor = [UIColor redColor];
    namelabel.font = [UIFont systemFontOfSize:15.0];
    namelabel.text = @"苹果公司";
    [scrollView addSubview:namelabel];
    
    UILabel *descriptionLabel = [UILabel new];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    descriptionLabel.text = @"苹果公司（Apple Inc. ）是美国的一家高科技公司。由史蒂夫·乔布斯、斯蒂夫·沃兹尼亚克和罗·韦恩(Ron Wayne)等三人于1976年4月1日创立，并命名为美国苹果电脑公司（Apple Computer Inc. ）， 2007年1月9日更名为苹果公司，总部位于加利福尼亚州的库比蒂诺。\n苹果公司创立之初主要开发和销售的个人电脑，截至2014年致力于设计、开发和销售消费电子、计算机软件、在线服务和个人计算机。苹果的Apple II于1970年代助长了个人电脑革命，其后的Macintosh接力于1980年代持续发展。该公司硬件产品主要是Mac电脑系列、iPod媒体播放器、iPhone智能手机和iPad平板电脑；在线服务包括iCloud、iTunes Store和App Store；消费软件包括OS X和iOS操作系统、iTunes多媒体浏览器、Safari网络浏览器，还有iLife和iWork创意和生产力套件。苹果公司在高科技企业中以创新而闻名世界。\n苹果公司1980年12月12日公开招股上市，2012年创下6235亿美元的市值记录，截至2014年6月，苹果公司已经连续三年成为全球市值最大公司。苹果公司在2014年世界500强排行榜中排名第15名。2013年9月30日，在宏盟集团的“全球最佳品牌”报告中，苹果公司超过可口可乐成为世界最有价值品牌。2014年，苹果品牌超越谷歌（Google），成为世界最具价值品牌 。";
    descriptionLabel.numberOfLines = 0;
    [scrollView addSubview:descriptionLabel];
    
    
    NSLayoutConstraint *nameLabelLeadingConstraint = [NSLayoutConstraint constraintWithItem:namelabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *nameLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:namelabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeTrailingMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *nameLabelTopConstraint = [NSLayoutConstraint constraintWithItem:namelabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *nameLabelHeighConstraint = [NSLayoutConstraint constraintWithItem:namelabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:40];
    nameLabelLeadingConstraint.active = YES;
    nameLabelTrailingConstraint.active = YES;
    nameLabelTopConstraint.active = YES;
    nameLabelHeighConstraint.active = YES;
    
    NSLayoutConstraint *descriptionLabelLeadingConstraint = [NSLayoutConstraint constraintWithItem:descriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *descriptionLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:descriptionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeTrailingMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *descriptionLabelTopContraint = [NSLayoutConstraint constraintWithItem:descriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:namelabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *descriptionLabelBottomConstraint = [NSLayoutConstraint constraintWithItem:descriptionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    descriptionLabelLeadingConstraint.active = YES;
    descriptionLabelTrailingConstraint.active = YES;
    descriptionLabelTopContraint.active = YES;
    descriptionLabelBottomConstraint.active = YES;
    
    NSLayoutConstraint *nameLabelWidthContraint = [NSLayoutConstraint constraintWithItem:namelabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:logoImageView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    NSLayoutConstraint *descriptionLabelWithConstraint = [NSLayoutConstraint constraintWithItem:descriptionLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:logoImageView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    nameLabelWidthContraint.active = YES;
    descriptionLabelWithConstraint.active = YES;
}
@end
