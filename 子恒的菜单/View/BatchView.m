//
//  BatchView.m
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import "BatchView.h"

@implementation BatchView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"BatchView" owner:nil options:nil] firstObject];
        self.frame = frame;
    }
    return self;
    
}

@end
