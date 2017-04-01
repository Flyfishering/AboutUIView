//
//  DrawRectDemoOneView.m
//  AboutUIView
//
//  Created by mac on 16/12/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DrawRectDemoOneView.h"

@implementation DrawRectDemoOneView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.




- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect    myFrame = self.bounds;
    
    // Set the line width to 10 and inset the rectangle by
    // 5 pixels on all sides to compensate for the wider line.
    CGContextSetLineWidth(context, 10);
    CGRectInset(myFrame, 5, 5);
    
    [[UIColor redColor] set];
    UIRectFrame(myFrame);
}

@end
