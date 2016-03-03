//
//  HomeFooterView.h
//  train
//
//  Created by rp.wang on 16/1/20.
//  Copyright © 2016年 vito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseFooterView : UIView

/**
 *  初始化
 */
- (instancetype)initWithfootView:(CGPoint)origin andHeight:(CGFloat)height;

/**
 *  按钮点击事件
 */
@property (strong, nonatomic) UIButton *FootBtn;

@end
