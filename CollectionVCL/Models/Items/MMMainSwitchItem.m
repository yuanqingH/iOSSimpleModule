//
//  MMMainSwitchItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainSwitchItem.h"

@implementation MMMainSwitchItem
- (id)init{
    self = [super init];
    if (self) {
        self.size = CGSizeMake(self.size.width, 44);
    }
    return self;
}
- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainSwitchCell");
    return cellClass;
}
@end
