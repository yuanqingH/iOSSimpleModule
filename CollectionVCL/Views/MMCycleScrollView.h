//
//  MMCycleScrollView.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCycleScrollElementItem.h"
@protocol MMCycleScrollViewDelegate<NSObject>
- (void)didClickCycleScrollView:(MMCycleScrollElementItem *)item atIndex:(NSInteger)index;
@end

@interface MMCycleScrollView : UIView
@property (nonatomic,strong) NSArray *cycleItems;

@property (nonatomic,weak) id<MMCycleScrollViewDelegate> delegate;
- (void)reloadData;
@end
