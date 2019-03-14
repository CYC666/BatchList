//
//  DishListController.m
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import "DishListController.h"
#import "DishListCell.h"

#import "BatchModel.h"
#import "OrderModel.h"
#import "DishModel.h"

@interface DishListController () <UITableViewDelegate, UITableViewDataSource, DishListCellDelegate> {
    
    NSMutableArray *dataArray;   // 数据列表
    
}

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end

@implementation DishListController

#pragma mark ========================================生命周期========================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"桌台状态";
    self.view.backgroundColor = WhiteColor;
    dataArray = [NSMutableArray array];
    
    
    
    // 创建视图
    [self creatSubViewsAction];
    
    // 创建假数据【相当于网络请求数据】
    [self loadDataAction];
    
    // 计算单元格的高度
    [self calculteCellLayoutAction];
    
    // 刷新表视图
    [_listTableView reloadData];
    
}


#pragma mark ========================================私有方法=============================================

#pragma mark - 创建视图
- (void)creatSubViewsAction {
    
    // 表视图
    _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _listTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _listTableView.backgroundColor = [UIColor clearColor];
    _listTableView.rowHeight = 62;
    _listTableView.sectionHeaderHeight = 0.01;
    _listTableView.sectionFooterHeight = 0.01;
    _listTableView.estimatedRowHeight = 0;
    _listTableView.estimatedSectionFooterHeight = 0;
    _listTableView.estimatedSectionHeaderHeight = 0;
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    [_listTableView registerClass:[DishListCell class] forCellReuseIdentifier:@"DishListCell"];
    
    if(@available(iOS 11.0, *)){
        _listTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark - 计算cell的布局【其实这一步，在获取数据的时候就可以算出来，这里为了方便代码审查，所以单独提出来计算】
- (void)calculteCellLayoutAction {
    
    
    for (NSInteger i = 0; i < 10; i++) {
        
        // 计算批次的高度
        BatchModel *batch = dataArray[i];
        float batchHeight = 0;
        
        for (NSInteger j = 0; j < batch.orderList.count; j++) {
            
            // 计算就餐顺序的高度
            OrderModel *order = batch.orderList[j];
            float orderHeight = 0;
            
            for (NSInteger k = 0; k < order.dishList.count; k++) {
                
                DishModel *dish = order.dishList[k];
                
                // 计算菜单的高度
                if (dish.didExtension) {
                    dish.dishHeight = 90;
                } else {
                    dish.dishHeight = 45;
                }
                
                orderHeight += dish.dishHeight;
            }
            
            order.orderHeight = orderHeight;
            batchHeight += orderHeight;
        }
        
        batch.batchHeight += batchHeight;
    }
    
}

#pragma mark ========================================动作响应=============================================


#pragma mark ========================================网络请求=============================================

#pragma mark - 获取数据
- (void)loadDataAction {
    
    
    // 10个批次
    for (NSInteger i = 0; i < 10; i++) {
        
        BatchModel *batch = [BatchModel new];
        batch.batchID = [NSString stringWithFormat:@"%ld", i];
        batch.title = [NSString stringWithFormat:@"%ld", i];
        
        
        // 3个就餐序号
        for (NSInteger j = 0; j < 3; j++) {
            
            OrderModel *order = [OrderModel new];
            order.orderID = [NSString stringWithFormat:@"%ld", j];
            if (j == 0) {
                order.title = @"A";
            } else if (j == 1) {
                order.title = @"B";
            } else {
                order.title = @"C";
            }
            
            NSInteger count = i + 1;
            for (NSInteger k = 0; k < count; k++) {
                
                DishModel *dish = [DishModel new];
                dish.dishID = [NSString stringWithFormat:@"%ld", k];
                dish.name = @"宫保鸡丁";
                dish.number = @"1";
                dish.time = @"08:50";
                dish.price = @"$15.00";
                dish.status = @"制作中";
                dish.allowShow = YES;
                dish.allowExchange = YES;
                dish.allowBack = YES;
                dish.allowUp = YES;
                dish.allowDown = YES;
                
                if (k % 2) {
                    dish.didExtension = YES;
                } else {
                    dish.didExtension = NO;
                }
                
                [order.dishList addObject:dish];
            }
            
            [batch.orderList addObject:order];
            
        }
        
        [dataArray addObject:batch];
    }
    
    
    
}


#pragma mark ========================================代理方法=============================================

#pragma mark - 表视图代理方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataArray.count;
//    return 20;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < dataArray.count) {
        BatchModel *batch = dataArray[indexPath.row];
        
        return batch.batchHeight;
        
    } else {
        return 0;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DishListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DishListCell"
                                                         forIndexPath:indexPath];
    
    if (indexPath.row < dataArray.count) {
        cell.batch = dataArray[indexPath.row];
        cell.cellDelegate = self;
    }
    
    return cell;
    
}


#pragma mark - 单元格里面按钮的代理方法
// 开始
- (void)DishListCellOrderStartAction:(OrderModel *)order andBatch:(nonnull BatchModel *)batch{
    
    NSString *text = [NSString stringWithFormat:@"开始 \n 批次ID:%@ \n 就餐顺序ID:%@", batch.batchID, order.orderID];
    SVP_SUCCESS(text)
    
}

// 查看
- (void)DishListCellDishShowAction:(DishModel *)dish andOrder:(nonnull OrderModel *)order andBatch:(nonnull BatchModel *)batch{
    
    NSString *text = [NSString stringWithFormat:@"查看 \n 批次ID:%@ \n 就餐顺序ID:%@ \n 菜ID:%@", batch.batchID, order.orderID, dish.dishID];
    SVP_SUCCESS(text)
    
}

// 转菜
- (void)DishListCellDishExchangeAction:(DishModel *)dish andOrder:(nonnull OrderModel *)order andBatch:(nonnull BatchModel *)batch{
    
    NSString *text = [NSString stringWithFormat:@"转菜 \n 批次ID:%@ \n 就餐顺序ID:%@ \n 菜ID:%@", batch.batchID, order.orderID, dish.dishID];
    SVP_SUCCESS(text)
    
}

// 退菜
- (void)DishListCellDishBackAction:(DishModel *)dish andOrder:(nonnull OrderModel *)order andBatch:(nonnull BatchModel *)batch{
    
    NSString *text = [NSString stringWithFormat:@"退菜 \n 批次ID:%@ \n 就餐顺序ID:%@ \n 菜ID:%@", batch.batchID, order.orderID, dish.dishID];
    SVP_SUCCESS(text)
    
}

// 上移
- (void)DishListCellDishUpAction:(DishModel *)dish andOrder:(nonnull OrderModel *)order andBatch:(nonnull BatchModel *)batch{
    
    NSString *text = [NSString stringWithFormat:@" 上移 \n 批次ID:%@ \n 就餐顺序ID:%@ \n 菜ID:%@", batch.batchID, order.orderID, dish.dishID];
    SVP_SUCCESS(text)
    
}

// 下移
- (void)DishListCellDishDownAction:(DishModel *)dish andOrder:(nonnull OrderModel *)order andBatch:(nonnull BatchModel *)batch{
    
    NSString *text = [NSString stringWithFormat:@"下移 \n 批次ID:%@ \n 就餐顺序ID:%@ \n 菜ID:%@", batch.batchID, order.orderID, dish.dishID];
    SVP_SUCCESS(text)
    
}

#pragma mark ========================================通知================================================






































@end
