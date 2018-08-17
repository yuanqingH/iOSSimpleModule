//
//  MMMainPickerItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainPickerItem.h"

@implementation MMMainPickerItem
- (id)init{
    self = [super init];
    if (self) {
        self.selectedDict = @{@"rowOfComponentOne":@(0),@"rowOfComponentTwo":@(0)};
        self.size = CGSizeMake(self.size.width, 150);
    }
    return self;
}

- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainPickerCell");
    return cellClass;
}
@end
