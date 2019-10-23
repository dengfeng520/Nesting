//
//  HomeTableViewCell.h
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
/**
 *  数据源数组用来接受controller传过来的数据
 */
@property (strong, nonatomic) NSArray *HomeArray;


@property (weak, nonatomic) IBOutlet UICollectionView *CollView;

@property (copy, nonatomic) void (^didSelectItemWithBlock)(NSInteger item);

@end
