//
//  MMMainSwitchCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainSwitchCell.h"
#import "MMMainSwitchItem.h"

@interface MMMainSwitchCell()
@property (nonatomic,strong) UISwitch *switchView;
@end
@implementation MMMainSwitchCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSwitchView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)createSwitchView{
    self.switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 6, 88, 30)];
    self.switchView.on = NO;
    self.switchView.onTintColor = [UIColor redColor];
    [self.switchView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.switchView];
}


- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainSwitchItem class]]){
        MMMainSwitchItem *aItem = (MMMainSwitchItem *)obj;
        self.switchView.on = aItem.isOn;
    }
}

- (void)valueChange:(id)sender{
    UISwitch *control = (UISwitch *)sender;
    if([self.elementItem isKindOfClass:[MMMainSwitchItem class]]){
        MMMainSwitchItem *aItem = (MMMainSwitchItem *)self.elementItem;
        if (aItem.isOn != control.isOn) {
            aItem.isOn = control.isOn;
        }
    }
}

@end
