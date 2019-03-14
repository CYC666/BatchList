//
//  OrderModel.h
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject

// 顺序 ABCD

@property (copy, nonatomic) NSString *orderID;
@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL allowStart;          // 是否显示<<开始>>按钮
@property (strong, nonatomic) NSMutableArray *dishList; // 菜单列表


// 这个是计算出来的
@property (assign, nonatomic) float orderHeight;        // 就餐顺序的高度




@end

NS_ASSUME_NONNULL_END
