//
//  MMCycleScrollElementCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMCycleScrollElementCell.h"
#import "MMCycleScrollElementItem.h"

@interface MMCycleScrollElementCell()
@property (nonatomic,strong) UIImageView *imageView;
@end
@implementation MMCycleScrollElementCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageView];
    }
    
    return self;
}

- (void)createImageView{
    self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    self.imageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.imageView];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    self.imageView.image = nil;
}


- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMCycleScrollElementItem class]]){
        MMCycleScrollElementItem *aItem = (MMCycleScrollElementItem *)obj;
        self.imageView.image = [UIImage imageNamed:aItem.imageName];
    }
}
@end
