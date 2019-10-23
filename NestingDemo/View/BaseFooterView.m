//
//  HomeFooterView.m
//  train
//
//  Created by rp.wang on 16/1/20.
//  Copyright © 2016年 vito. All rights reserved.
//

#import "BaseFooterView.h"
#import "Header.h"

@implementation BaseFooterView

- (instancetype)initWithfootView:(CGPoint)origin andHeight:(CGFloat)height {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, screenSize.width, height)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 36)];
    
    UIButton *button1=[UIButton buttonWithType:(UIButtonTypeCustom)];
    button1.frame = CGRectMake(view.frame.size.width / 2 - 75, 0, 150, 36);
    
    [button1 setTitle:@"更多精彩教学视频" forState:UIControlStateNormal];
    [button1 setTitleColor:UIColorFromRGB(0xd13d20) forState:UIControlStateNormal];
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button1.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [view addSubview:button1];
    
    UIImageView *markview2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 95, 8, 20, 20)];
    
    markview2.image = [UIImage imageNamed:@"vido_more"];
    
    [view addSubview:markview2];
    
    self.FootBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.FootBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 36);
    
    [view  addSubview:self.FootBtn];
    
    [self addSubview:view];
    return self;
}

@end
