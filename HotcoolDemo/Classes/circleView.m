//
//  circleView.m
//  HotcoolDemo
//
//  Created by zero on 2017/6/18.
//  Copyright © 2017年 cl. All rights reserved.
//

#import "circleView.h"

@implementation circleView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
//        self.alpha = 0.5;
        self.layer.cornerRadius = self.frame.size.width * 0.5;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
