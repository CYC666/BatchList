//
//  BatchModel.h
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BatchModel : NSObject

// 批次 1234
@property (copy, nonatomic) NSString *batchID;
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *orderList;    // 就餐序号列表


// 这个是计算出来的
@property (assign, nonatomic) float batchHeight;            // 批次的高度，也就是单元格的高度



@end

NS_ASSUME_NONNULL_END
