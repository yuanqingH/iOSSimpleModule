//
//  MMBaseStrategy.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMBaseStrategy : NSObject
@property (nonatomic,weak) id target;

- (instancetype)initWithTarget:(id)target;
@end
