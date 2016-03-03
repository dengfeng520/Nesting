//
//  HomeTableViewCell.h
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  代理，用来传递点击的是第几行,当触CollectionView的时候
 */
@protocol  delegateColl <NSObject>

-(void)ClickCooRow :(int)CellRow;

@end

@interface HomeTableViewCell : UITableViewCell
/**
 *  数据源数组用来接受controller传过来的数据
 */
@property (strong, nonatomic) NSArray *HomeArray;


@property (weak, nonatomic) IBOutlet UICollectionView *CollView;


@property (weak, nonatomic) id <delegateColl> delegateColl;

@end
