//
//  MMWeakTimerStrategy.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseStrategy.h"
@protocol MMWeakTimerStrategyDelegate<NSObject>
- (void)timerAction;
@end

@interface MMWeakTimerStrategy : MMBaseStrategy
@property (nonatomic,weak) id<MMWeakTimerStrategyDelegate> delegate;

- (void)fire;
- (void)invalidate;
@end
