//
//  MMMainSliderItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainSliderItem.h"

@implementation MMMainSliderItem
- (id)init{
    self = [super init];
    if (self) {
        self.size = CGSizeMake(self.size.width, 30);
        self.value = 0;
    }
    return self;
}

- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainSliderCell");
    return cellClass;
}
@end
