//
//  MMCycleScrollElementItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMCycleScrollElementItem.h"

@implementation MMCycleScrollElementItem
- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMCycleScrollElementCell");
    return cellClass;
}
@end
