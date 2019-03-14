//
//  OrderModel.m
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel


- (NSMutableArray *)dishList {
    
    if (!_dishList) {
        _dishList = [NSMutableArray array];
    }
    return _dishList;
    
}



@end
