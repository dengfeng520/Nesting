//
//  HomeCollectionViewCell.m
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeCollectionViewCell

- (void)fetchCollCellData:(HomeModel *)HModel {
    //图片
    [self.HeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",HModel.artworkUrl60]] placeholderImage:[UIImage imageNamed:@"pic_xwmr"]];
    
    
    //标题
    self.TitleLab.text = [NSString stringWithFormat:@"%@",HModel.trackName];
    self.TitleLab.textColor = [UIColor grayColor];
    self.TitleLab.font = [UIFont systemFontOfSize:12.0f];
    
}

@end
