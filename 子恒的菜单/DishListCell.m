//
//  DishListCell.m
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import "DishListCell.h"
#import "BatchView.h"
#import "OrderView.h"
#import "DishView.h"
#import "BatchModel.h"
#import "OrderModel.h"
#import "DishModel.h"

@implementation DishListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setBatch:(BatchModel *)batch {
    
    _batch = batch;
    
    __weak typeof(self) weakSelf = self;
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    
    // 避免复用
    [self.contentView removeAllSubviews];
    
    // 宽度【8等分】
    float width = kScreenWidth / 8.0;
    
    // 创建批次
    BatchView *batchView = [[BatchView alloc] initWithFrame:CGRectMake(0, 0, width, batch.batchHeight)];
    batchView.label.text = batch.title;
    [self.contentView addSubview:batchView];
    
    // 就餐顺序的起始Y
    float orderStartY = 0;
    for (NSInteger i = 0; i < batch.orderList.count; i++) {
        
        // 创建就餐顺序
        OrderModel *order = batch.orderList[i];
        OrderView *orderView = [[OrderView alloc] initWithFrame:CGRectMake(width, orderStartY, width, order.orderHeight)];
        orderView.label.text = order.title;
        orderView.button.hidden = order.allowStart;
        [self.contentView addSubview:orderView];
        
        [orderView.button addAction:^(NSInteger index) {
            
            // 给开始添加响应
            if (weakSelf.cellDelegate && [weakSelf.cellDelegate respondsToSelector:@selector(DishListCellOrderStartAction:andBatch:)]) {
                [weakSelf.cellDelegate DishListCellOrderStartAction:order andBatch:batch];
            }
            
        }];
        
        
        float dishStartY = 0;
        for (NSInteger j = 0; j < order.dishList.count; j++) {
            
            // 创建菜单
            DishModel *dish = order.dishList[j];
            DishView *dishView = [[DishView alloc] initWithFrame:CGRectMake(width * 2, orderStartY + dishStartY, width * 6, dish.dishHeight)];
            dishView.label1.text = dish.name;
            dishView.label2.text = dish.number;
            dishView.label3.text = dish.time;
            dishView.label4.text = dish.price;
            dishView.label5.text = dish.status;
            dishView.button1.hidden = !dish.allowShow;
            dishView.button2.hidden = !dish.allowExchange;
            dishView.button3.hidden = !dish.allowBack;
            dishView.button4.hidden = !dish.allowUp;
            dishView.button5.hidden = !dish.allowDown;
            [self.contentView addSubview:dishView];
            
            // 给按钮添加响应
            [dishView.button1 addAction:^(NSInteger index) {
                
                if (weakSelf.cellDelegate && [weakSelf.cellDelegate respondsToSelector:@selector(DishListCellDishShowAction:andOrder:andBatch:)]) {
                    [weakSelf.cellDelegate DishListCellDishShowAction:dish andOrder:order andBatch:batch];
                }
                
            }];
            
            [dishView.button2 addAction:^(NSInteger index) {
                
                if (weakSelf.cellDelegate && [weakSelf.cellDelegate respondsToSelector:@selector(DishListCellDishExchangeAction:andOrder:andBatch:)]) {
                    [weakSelf.cellDelegate DishListCellDishExchangeAction:dish andOrder:order andBatch:batch];
                }
                
            }];
            
            [dishView.button3 addAction:^(NSInteger index) {
                
                if (weakSelf.cellDelegate && [weakSelf.cellDelegate respondsToSelector:@selector(DishListCellDishBackAction:andOrder:andBatch:)]) {
                    [weakSelf.cellDelegate DishListCellDishBackAction:dish andOrder:order andBatch:batch];
                }
                
            }];
            
            [dishView.button4 addAction:^(NSInteger index) {
                
                if (weakSelf.cellDelegate && [weakSelf.cellDelegate respondsToSelector:@selector(DishListCellDishUpAction:andOrder:andBatch:)]) {
                    [weakSelf.cellDelegate DishListCellDishUpAction:dish andOrder:order andBatch:batch];
                }
                
            }];
            
            [dishView.button5 addAction:^(NSInteger index) {
                
                if (weakSelf.cellDelegate && [weakSelf.cellDelegate respondsToSelector:@selector(DishListCellDishDownAction:andOrder:andBatch:)]) {
                    [weakSelf.cellDelegate DishListCellDishDownAction:dish andOrder:order andBatch:batch];
                }
                
            }];
            
            
            // 记录下一个菜单的起始Y
            dishStartY += dish.dishHeight;
            
        }
        
        // 记录下一个就餐顺序的起始Y
        orderStartY += order.orderHeight;
        
    }
    
    
    
}







































@end
