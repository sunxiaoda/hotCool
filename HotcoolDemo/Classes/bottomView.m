//
//  bottomView.m
//  HotcoolDemo
//
//  Created by zero on 2017/6/18.
//  Copyright © 2017年 cl. All rights reserved.
//

#import "bottomView.h"

@implementation bottomView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    //箭头按钮
    CGFloat arrowBtnW = 25;
    CGFloat arrowBtnH = 20;
    UIButton *arrowBtn = [[MoreButton alloc]initWithFrame:CGRectMake(0, 0, arrowBtnW, arrowBtnH)];
    arrowBtn.centerX = self.width * 0.5;
    arrowBtn.backgroundColor = [UIColor clearColor];
    [arrowBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [arrowBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    [self addSubview:arrowBtn];
    [arrowBtn addTarget:self action:@selector(arrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    arrowBtn.selected = YES;
    
    //个人中心
    CGFloat btnW = 35;
    UIButton *personBtn = [[MoreButton alloc]initWithFrame:CGRectMake(MARGIN5, self.height * 0.5 - btnW, btnW, btnW)];
    [personBtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self addSubview:personBtn];
    [personBtn addTarget:self action:@selector(personBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    personBtn.backgroundColor = [UIColor orangeColor];
    
    //健身
    UIButton *fitnessBtn = [[MoreButton alloc]initWithFrame:CGRectMake(self.width - btnW - MARGIN5, personBtn.y, btnW, btnW)];
    [fitnessBtn setImage:[UIImage imageNamed:@"fitness"] forState:UIControlStateNormal];
    [self addSubview:fitnessBtn];
    [fitnessBtn addTarget:self action:@selector(fitnessBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    fitnessBtn.backgroundColor = [UIColor orangeColor];
    
    //二维码
    UIButton *codeBtn = [[MoreButton alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    codeBtn.centerX = self.width * 0.5;
    codeBtn.centerY = self.height * 0.25;
    [codeBtn setBackgroundImage:[UIImage imageNamed:@"quickmark"] forState:UIControlStateNormal];
    [self addSubview:codeBtn];
    [codeBtn addTarget:self action:@selector(codeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)arrowBtnClicked:(UIButton *)btn
{
    NSLog(@"点击了箭头按钮");
    
    
    CGFloat offset = self.height * 0.5 - btn.height;
    
    if (btn.selected) {
        
        //点击消失
        [UIView animateWithDuration:0.5 animations:^{
            
            self.transform = CGAffineTransformMakeTranslation(0, offset);
            
        }completion:^(BOOL finished) {
            
            btn.selected = NO;
            
        }];
    }else
    {
        //点击显示
        [UIView animateWithDuration:0.5 animations:^{
            
            self.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished) {
            
            btn.selected = YES;
            
        }];
        
        
    }
    
}

- (void)personBtnClicked:(UIButton *)btn
{
    NSLog(@"点击了个人中心");

}

- (void)fitnessBtnClicked:(UIButton *)btn
{
    NSLog(@"点击了健身");
    
}

- (void)codeBtnClicked:(UIButton *)btn
{
    NSLog(@"点击了二维码");
    
}
@end
