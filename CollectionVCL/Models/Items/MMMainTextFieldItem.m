//
//  MMMainTextFieldItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainTextFieldItem.h"

@implementation MMMainTextFieldItem
- (id)init{
    self = [super init];
    if (self) {
        self.size = CGSizeMake(self.size.width, 44);
    }
    return self;
}

- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainTextFieldCell");
    return cellClass;
}
@end
