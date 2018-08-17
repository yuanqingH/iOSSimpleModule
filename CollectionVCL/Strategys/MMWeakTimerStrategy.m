//
//  MMWeakTimerStrategy.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMWeakTimerStrategy.h"


@interface MMWeakTimerStrategy()
@property (nonatomic,weak) NSTimer *timer;
@end
@implementation MMWeakTimerStrategy
- (id)init{
    self = [super init];
    if (self) {
    
    }
    
    return self;
}

- (void)timerAction{
    if ([self.delegate respondsToSelector:@selector(timerAction)]) {
        [self.delegate timerAction];
    }
}

- (void)fire{
    if (self.timer) {
        [self invalidate];
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)invalidate{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)dealloc{
    [self invalidate];
}
@end
