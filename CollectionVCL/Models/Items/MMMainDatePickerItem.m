//
//  MMMainDatePickerItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainDatePickerItem.h"
@interface MMMainDatePickerItem()
@end
@implementation MMMainDatePickerItem
- (id)init{
    self = [super init];
    if (self) {
        self.formatter = [[NSDateFormatter alloc] init];
        [self.formatter setDateFormat:@"yyyy年MM月dd日(EEEE)"];
        self.size = CGSizeMake(self.size.width, 100);
        
        self.selectedDate = [[NSDate alloc] init];
    }
    return self;
}

- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainDatePickerCell");
    return cellClass;
}
@end
