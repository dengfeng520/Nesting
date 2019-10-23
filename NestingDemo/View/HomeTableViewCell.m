//
//  HomeTableViewCell.m
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "HomeCollectionViewCell.h"
#import "Header.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.HomeArray.count;
}
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeModel *HModel = [self.HomeArray objectAtIndex:indexPath.row];
    
    HomeCollectionViewCell *collcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollCell" forIndexPath:indexPath];
    
 
    [collcell fetchCollCellData:HModel];
    

    return collcell;
}
// MARK: - UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH / 2 - 8, 145);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(3, 3, 0.1, 3);
}
// MARK: - UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (self.didSelectItemWithBlock) {
        self.didSelectItemWithBlock(indexPath.row);
    }
}

//接收数据
- (void)getHomeArray:(NSArray *)homeArray {
    self.HomeArray = homeArray;
}

@end
