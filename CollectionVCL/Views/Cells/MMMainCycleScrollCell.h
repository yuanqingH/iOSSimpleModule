//
//  MMMainCycleScrollCell.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseCollectionViewCell.h"
#import "MMCycleScrollElementItem.h"
@protocol MMMainCycleScrollCellDelegate<NSObject>
- (void)didClickCycleScrollView:(MMCycleScrollElementItem *)item  atIndex:(NSInteger)index;
@end

@interface MMMainCycleScrollCell : MMBaseCollectionViewCell
@property (nonatomic,weak) id<MMMainCycleScrollCellDelegate> delegate;
@end
