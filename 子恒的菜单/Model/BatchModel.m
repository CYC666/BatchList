//
//  BatchModel.m
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import "BatchModel.h"

@implementation BatchModel

- (NSMutableArray *)orderList {
    
    if (!_orderList) {
        _orderList = [NSMutableArray array];
    }
    return _orderList;
    
}

@end
