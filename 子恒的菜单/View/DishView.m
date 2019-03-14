//
//  DishView.m
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import "DishView.h"

@implementation DishView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"DishView" owner:nil options:nil] firstObject];
        self.frame = frame;
    }
    return self;
    
}

@end
