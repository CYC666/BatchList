//
//  DishView.h
//  ToyMarket
//
//  Created by 曹老师 on 2019/3/14.
//  Copyright © 2019 众利创投. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DishView : UIView


@property (weak, nonatomic) IBOutlet UILabel *label1;   // 菜名
@property (weak, nonatomic) IBOutlet UILabel *label2;   // 数量
@property (weak, nonatomic) IBOutlet UILabel *label3;   // 下单时间
@property (weak, nonatomic) IBOutlet UILabel *label4;   // 金额
@property (weak, nonatomic) IBOutlet UILabel *label5;   // 状态

@property (weak, nonatomic) IBOutlet UIButton *button1; // 备注【查看】
@property (weak, nonatomic) IBOutlet UIButton *button2; // 转菜
@property (weak, nonatomic) IBOutlet UIButton *button3; // 退菜
@property (weak, nonatomic) IBOutlet UIButton *button4; // 上移
@property (weak, nonatomic) IBOutlet UIButton *button5; // 下移






@end

NS_ASSUME_NONNULL_END
