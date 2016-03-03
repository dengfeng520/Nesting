//
//  ViewController.m
//  NestingDemo
//
//  Created by rp.wang on 16/3/3.
//  Copyright © 2016年 rp.wang. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "ViewModel.h"
#import "HomeModel.h"
#import "BaseHeaderView.h"
#import "BaseFooterView.h"
#import "SVProgressHUD.h"
#import "MJRefresh.h"


@interface ViewController ()<delegateColl>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  数组源数组
 */
@property (strong, nonatomic) NSArray *HomeList;
/**
 *  记录上拉刷新的次数默认为2
 */
@property (assign, nonatomic) int Num;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.Num = 2;
    
    [self getServerData];
    
    [self AddHeaderorFooter];
}

#pragma mark - 从服务器访问数据
-(void)getServerData
{
    [SVProgressHUD show];
    NSDictionary *PostData =@{@"term":@"game",@"country":@"cn",@"entity":@"software"};
    [ViewModel getGuestData:PostData secuessBlock:^(NSArray *DataList){
        [SVProgressHUD dismiss];
        self.HomeList = DataList;
        [self.tableView reloadData];
    } ErrCode:^(NSString *ErrCode){
        [SVProgressHUD showErrorWithStatus:@"服务器异常"];
        [SVProgressHUD dismiss];
    }];
}


#pragma mark - 上拉刷新下拉加载
-(void)AddHeaderorFooter
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^(void){
        [SVProgressHUD show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [self.tableView.mj_header endRefreshing];
            self.Num = 2;
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
        });
        
    }];
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [SVProgressHUD show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ++self.Num;
            [self.tableView reloadData];
            // 结束刷新
            [self.tableView.mj_footer endRefreshing];
            [SVProgressHUD dismiss];
        });
    }];
}

#pragma mark -
#pragma mark UITableView Datasource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  self.Num * 155 + 5;
   
}
//根据数组的长度动态设置cell的高度
-(float) GetCellHeight :(float) ListCount
{
    float cellH = round(ListCount / 2);
    cellH = ceilf(ListCount / 2);
    return cellH;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    //获取到数据后刷新
    cell.HomeArray = self.HomeList;
    [cell.CollView reloadData];
    cell.CollView.backgroundColor = [UIColor whiteColor];
    //防止出现collerview滚动
    cell.CollView.scrollEnabled = NO;
    //实现代理
    cell.delegateColl = self;
    
    return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    BaseHeaderView *HeaderView = [[BaseHeaderView alloc]initWithHeaderView:CGPointMake(0, 0) andHeight:34];
 
    HeaderView.HeaderLab.text = @"最新游戏";
       
    return HeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return 34;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
#pragma mark - 代理用来接收点击的是第几个
-(void)ClickCooRow :(int)CellRow
{
    printf("\n点击的是==========%d\n",CellRow);
}

#pragma mark - 内存相关
-(NSArray *)HomeList
{
    if(_HomeList == nil)
    {
        _HomeList = [NSArray array];
    }
    return _HomeList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
