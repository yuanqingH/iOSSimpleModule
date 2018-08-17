//
//  MMCycleTagPointView.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMCycleTagPointView : UIView
- (instancetype)initWithItems:(NSArray *)items;
- (instancetype)initWithItems:(NSArray *)items currentIndex:(NSInteger)index;

- (void)scrollToIndex:(NSInteger)index;
@end
