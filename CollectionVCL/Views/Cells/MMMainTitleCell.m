//
//  MMMainTitleCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainTitleCell.h"
#import "MMMainTitleItem.h"

@interface MMMainTitleCell()
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation MMMainTitleCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTitleLabel];
    }
    
    return self;
}

- (void)createTitleLabel{
    self.titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:self.titleLabel];
}


- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainTitleItem class]]){
        MMMainTitleItem *aItem = (MMMainTitleItem *)obj;
        self.titleLabel.text = aItem.title;
    }
}


@end
