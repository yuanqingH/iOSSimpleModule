//
//  MMMainDatePickerItem.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseItem.h"

@interface MMMainDatePickerItem : MMBaseItem
@property (nonatomic,strong) NSDateFormatter *formatter;
@property (nonatomic,strong) NSDate *selectedDate;
@end
