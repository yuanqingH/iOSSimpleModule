//
//  MMMainCycleScrollCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainCycleScrollCell.h"
#import "MMCycleScrollView.h"
#import "MMMainCycleScrollItem.h"

@interface MMMainCycleScrollCell()<MMCycleScrollViewDelegate>
@property (nonatomic,strong) MMCycleScrollView *cycleScrollView;
@end
@implementation MMMainCycleScrollCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCycleScrollView];
    }
    
    return self;
}

- (void)createCycleScrollView{
    self.cycleScrollView = [[MMCycleScrollView alloc] initWithFrame:self.contentView.bounds];
    self.cycleScrollView.backgroundColor = [UIColor orangeColor];
    self.cycleScrollView.delegate = self;
    [self.contentView addSubview:self.cycleScrollView];
}


- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainCycleScrollItem class]]){
        MMMainCycleScrollItem *aItem = (MMMainCycleScrollItem *)obj;
        if (self.cycleScrollView.cycleItems != aItem.items) {
            self.cycleScrollView.cycleItems = aItem.items;
            [self.cycleScrollView reloadData];
        }
    }
}

#pragma mark - MMCycleScrollViewDelegate
- (void)didClickCycleScrollView:(MMCycleScrollElementItem *)item atIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(didClickCycleScrollView: atIndex:)]) {
        [self.delegate didClickCycleScrollView:item atIndex:index];
    }
}


@end
