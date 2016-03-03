//
//  HomeCollectionViewCell.h
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *HeadImg;

@property (weak, nonatomic) IBOutlet UILabel *TitleLab;

/**
 *  接收数据
 */
-(void)SetCollCellData :(HomeModel *)HModel;
@end
