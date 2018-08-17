//
//  MMBaseItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseItem.h"

@implementation MMBaseItem
- (instancetype)init{
    self = [super init];
    if (self) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        self.size = CGSizeMake(w, 0);
    }
    return self;
}

//require override
- (Class)viewClass{
    return [UIView class];
}
@end
