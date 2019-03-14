//
//  DishListCell.h
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BatchModel, OrderModel, DishModel;

NS_ASSUME_NONNULL_BEGIN


@protocol DishListCellDelegate<NSObject>

@optional
// 开始
- (void)DishListCellOrderStartAction:(OrderModel *)order andBatch:(BatchModel *)batch;
// 查看
- (void)DishListCellDishShowAction:(DishModel *)dish andOrder:(OrderModel *)order andBatch:(BatchModel *)batch;
// 转菜
- (void)DishListCellDishExchangeAction:(DishModel *)dish andOrder:(OrderModel *)order andBatch:(BatchModel *)batch;
// 退菜
- (void)DishListCellDishBackAction:(DishModel *)dish andOrder:(OrderModel *)order andBatch:(BatchModel *)batch;       
// 上移
- (void)DishListCellDishUpAction:(DishModel *)dish andOrder:(OrderModel *)order andBatch:(BatchModel *)batch;
// 下移
- (void)DishListCellDishDownAction:(DishModel *)dish andOrder:(OrderModel *)order andBatch:(BatchModel *)batch;



@end


@interface DishListCell : UITableViewCell

@property (strong, nonatomic) BatchModel *batch;    // 数据

// 代理
@property (weak, nonatomic) NSObject<DishListCellDelegate>* cellDelegate;


@end

NS_ASSUME_NONNULL_END
