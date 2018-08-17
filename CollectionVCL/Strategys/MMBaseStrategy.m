//
//  MMBaseStrategy.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseStrategy.h"

@implementation MMBaseStrategy
- (instancetype)initWithTarget:(id)target{
    self = [super init];
    if (self) {
        self.target = target;
    }
    
    return self;
}
@end
