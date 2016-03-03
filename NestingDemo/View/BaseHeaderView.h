//
//  HomeHeaderView.h
//  train
//
//  Created by rp.wang on 16/1/20.
//  Copyright © 2016年 vito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseHeaderView : UIView

/**
 *  初始化view
 */
- (instancetype)initWithHeaderView:(CGPoint)origin andHeight:(CGFloat)height;
/**
 *  Label文字
 */
@property (strong, nonatomic) UILabel *HeaderLab;

@end
