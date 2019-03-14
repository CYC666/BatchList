//
//  DishModel.h
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DishModel : NSObject

// 菜 手撕包菜

@property (copy, nonatomic) NSString *dishID;
@property (copy, nonatomic) NSString *name;         // 菜名
@property (copy, nonatomic) NSString *number;       // 数量
@property (copy, nonatomic) NSString *time;         // 下单时间
@property (copy, nonatomic) NSString *price;        // 金额
@property (copy, nonatomic) NSString *remarks;      // 备注
@property (copy, nonatomic) NSString *status;       // 状态
@property (assign, nonatomic) BOOL allowShow;       // 是否显示<<查看>>按钮
@property (assign, nonatomic) BOOL allowExchange;   // 是否显示<<转菜>>按钮
@property (assign, nonatomic) BOOL allowBack;       // 是否显示<<退菜>>按钮
@property (assign, nonatomic) BOOL allowUp;         // 是否显示<<上移>>按钮
@property (assign, nonatomic) BOOL allowDown;       // 是否显示<<下移>>按钮

@property (assign, nonatomic) BOOL didExtension;    // 是否是展开状态


@property (assign, nonatomic) float dishHeight;     // 展开45+45=90、收起45


@end

NS_ASSUME_NONNULL_END
