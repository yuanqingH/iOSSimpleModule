//
//  MMMainPickerItem.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseItem.h"

@interface MMMainPickerItem : MMBaseItem
@property (nonatomic,strong) NSArray *kindArray;
@property (nonatomic,strong) NSArray *elementArray;

@property (nonatomic,strong) NSDictionary *selectedDict;
@end
