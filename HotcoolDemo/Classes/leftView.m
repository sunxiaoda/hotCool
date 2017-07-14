//
//  leftView.m
//  HotcoolDemo
//
//  Created by zero on 2017/6/18.
//  Copyright © 2017年 cl. All rights reserved.
//

#import "leftView.h"

@implementation leftView

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

    //文字
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor whiteColor];
    label.font =  SYStemFont(15);
    [self addSubview:label];
    label.numberOfLines  = 0;
    
    NSString *string = @"温度 22 / PM 1.6\n推荐运动:跑步\n自我规划:俯卧撑100\n团队中排名:12";
    label.text = string;
    [label sizeToFit];
    label.x = KSCREENW * 0.25 + MARGIN5;
    label.centerY = self.height * 0.5;
    
    //更多
    UIButton *moreBtn = [[UIButton alloc]init];
    [moreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    moreBtn.titleLabel.font = SYStemFont(15);
    [moreBtn setTitle:@"更多<<" forState:UIControlStateNormal];
    [moreBtn sizeToFit];
    moreBtn.x = label.x;
    moreBtn.y = CGRectGetMaxY(label.frame);
    [self addSubview:moreBtn];
    [moreBtn addTarget:self action:@selector(moreBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //箭头按钮
    CGFloat arrowBtnW = 20;
    CGFloat arrowBtnH = 25;
    UIButton *arrowBtn = [[MoreButton alloc]initWithFrame:CGRectMake(self.width - arrowBtnW, 0, arrowBtnW, arrowBtnH)];
    arrowBtn.centerY = self.height * 0.5;
    arrowBtn.backgroundColor = [UIColor clearColor];
    [arrowBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [arrowBtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateSelected];
    [self addSubview:arrowBtn];
    [arrowBtn addTarget:self action:@selector(arrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    arrowBtn.selected = YES;

}

- (void)moreBtnClicked
{
    NSLog(@"点击了更多按钮");
}

- (void)arrowBtnClicked:(UIButton *)btn
{
    NSLog(@"点击了箭头按钮");
    
    
    CGFloat offset = self.width - fabs(self.x) - btn.width;
    
    if (btn.selected) {
        
        //点击消失
        [UIView animateWithDuration:0.5 animations:^{
            
            self.transform = CGAffineTransformMakeTranslation(-offset, 0);
            
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
@end
