//
//  MMMainSliderCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainSliderCell.h"
#import "MMMainSliderItem.h"

@interface MMMainSliderCell()<UITextFieldDelegate>
@property (nonatomic,strong) UISlider *slider;
@end

@implementation MMMainSliderCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSlider];
    }
    
    return self;
}

- (void)createSlider{
    self.slider = [[UISlider alloc] initWithFrame:self.contentView.bounds];
    [self.slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    self.slider.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.slider];
}


- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainSliderItem class]]){
        MMMainSliderItem *aItem = (MMMainSliderItem *)obj;
        if (self.slider.value != aItem.value) {
            self.slider.value = aItem.value;
        }
    }
}

- (void)valueChanged:(id)sender{
    UISlider *control = (UISlider*)sender;
    if([self.elementItem isKindOfClass:[MMMainSliderItem class]]){
        MMMainSliderItem *aItem = (MMMainSliderItem *)self.elementItem;
        if (aItem.value != control.value) {
            aItem.value = control.value;
            
            if ([self.delegate respondsToSelector:@selector(sliderValueDidChange:)]) {
                [self.delegate sliderValueDidChange:aItem.value];
            }
        }
    }
}


@end
