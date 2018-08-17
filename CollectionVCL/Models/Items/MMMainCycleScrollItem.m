//
//  MMMainCycleScrollItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainCycleScrollItem.h"

@implementation MMMainCycleScrollItem
- (id)init{
    self = [super init];
    if (self) {
        self.size = CGSizeMake(self.size.width, 200);
        self.recoreIndex = 0;
    }
    return self;
}

- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainCycleScrollCell");
    return cellClass;
}
@end
