//
//  MMMainSegmentCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainSegmentCell.h"
#import "MMMainSegmentItem.h"

@interface MMMainSegmentCell()
@property (nonatomic,strong) UISegmentedControl *segmentControl;
@end
@implementation MMMainSegmentCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}


- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainSegmentItem class]]){
        MMMainSegmentItem *aItem = (MMMainSegmentItem *)obj;
        NSInteger count = [self.segmentControl numberOfSegments];
        
        if (count == 0 || (count != aItem.items.count && aItem.items.count > 0)) {
            if (self.segmentControl) {
                [self.segmentControl removeFromSuperview];
                [self.segmentControl removeAllSegments];
                self.segmentControl = nil;
            }
            self.segmentControl = [[UISegmentedControl alloc] initWithItems:aItem.items];
            [self.segmentControl addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
            [self.contentView addSubview:self.segmentControl];
            CGSize size = self.contentView.bounds.size;
            self.segmentControl.frame = CGRectMake((size.width - 300)/2, (size.height - 44)/2, 300, 44);
            
        }
        
        if (aItem.selectedIndex >= 0) {
            [self.segmentControl setSelectedSegmentIndex:aItem.selectedIndex];
        }
    }
}

- (void)valueChange:(id)sender{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if([self.elementItem isKindOfClass:[MMMainSegmentItem class]]){
        MMMainSegmentItem *aItem = (MMMainSegmentItem *)self.elementItem;
        NSInteger index = control.selectedSegmentIndex;
        aItem.selectedIndex = index;
    }
}

@end
