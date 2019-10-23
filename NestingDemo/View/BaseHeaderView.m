//
//  HomeHeaderView.m
//  train
//
//  Created by rp.wang on 16/1/20.
//  Copyright © 2016年 vito. All rights reserved.
//

#import "BaseHeaderView.h"
#import "Header.h"

@implementation BaseHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;

}
- (instancetype)initWithHeaderView:(CGPoint)origin andHeight:(CGFloat)height {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, screenSize.width, height)];

    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, super.frame.size.width, 34)];
    view.backgroundColor = [UIColor clearColor];
    
    UIImageView *iconview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, super.frame.size.width, 34)];
    
    iconview.image = [UIImage imageNamed:@"vido_smnav_bg"];
    
    [view addSubview:iconview];
    
    self.HeaderLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, super.frame.size.width, 34)];
    
    self.HeaderLab.text = @"==========最新视频==========";
    self.HeaderLab.font = [UIFont systemFontOfSize:20];
    self.HeaderLab.textColor = [UIColor whiteColor];
    self.HeaderLab.backgroundColor = [UIColor clearColor];
    self.HeaderLab.textAlignment = NSTextAlignmentCenter;
    
    [self.HeaderLab sizeToFit];
    [view addSubview:self.HeaderLab];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(85, 17, super.frame.size.width-30, 1)];
    line.backgroundColor = UIColorFromRGB(0x2ebb2b);
    
    [self addSubview:view];

    return self;
}
@end
