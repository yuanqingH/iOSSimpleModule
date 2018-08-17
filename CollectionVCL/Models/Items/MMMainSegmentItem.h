//
//  MMMainSegmentItem.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseItem.h"

@interface MMMainSegmentItem : MMBaseItem
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,assign) NSInteger selectedIndex;
@end
