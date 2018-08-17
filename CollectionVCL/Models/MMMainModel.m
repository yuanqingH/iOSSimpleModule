//
//  MMMainModel.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainModel.h"
#import "MMMainTextFieldItem.h"
#import "MMMainTitleItem.h"
#import "MMMainDatePickerItem.h"
#import "MMMainPickerItem.h"
#import "MMMainSliderItem.h"
#import "MMMainCycleScrollItem.h"
#import "MMCycleScrollElementItem.h"
#import "MMMainSwitchItem.h"
#import "MMMainSegmentItem.h"

@interface MMMainModel()
@property (nonatomic,strong) MMMainTextFieldItem *textFieldItem;

@property (nonatomic,strong) MMMainTitleItem *datePickerTitleItem;
@property (nonatomic,strong) MMMainDatePickerItem *datePickerItem;

@property (nonatomic,strong) MMMainTitleItem *pickerTitleItem;
@property (nonatomic,strong) MMMainPickerItem *pickerItem;

@property (nonatomic,strong) MMMainTitleItem *sliderTitleItem;
@property (nonatomic,strong) MMMainSliderItem *sliderItem;

@property (nonatomic,strong) MMMainCycleScrollItem *cycleScrollItem;

@property (nonatomic,strong) MMMainSwitchItem *switchItem;

@property (nonatomic,strong) MMMainSegmentItem *segmentItem;

@end

@implementation MMMainModel
- (void)loadItems:(NSDictionary *)paramters completion:(void (^)(NSDictionary *))completion failure:(void (^)(NSError *))failure{
    [self wrapperItems:nil];
    completion(nil);
}

- (void)wrapperItems:(NSDictionary *)dict{
    self.textFieldItem = [[MMMainTextFieldItem alloc] init];
    
    self.datePickerItem = [[MMMainDatePickerItem alloc] init];
    
    self.pickerItem = [[MMMainPickerItem alloc] init];
    [self createPickerSourceData];
    
    self.sliderItem = [[MMMainSliderItem alloc] init];
    
    self.cycleScrollItem = [[MMMainCycleScrollItem alloc] init];
    [self createCycleSourceData];
    
    self.switchItem = [[MMMainSwitchItem alloc] init];
    
    self.segmentItem = [[MMMainSegmentItem alloc] init];
    [self createSegmentSourceData];
    
    [self countItems];
}

- (void)refreshDatePickerTitleItem:(void(^)(void))reloadData{
    if (!self.datePickerItem.selectedDate) {
        self.datePickerTitleItem = nil;
    }else{
        if (!self.datePickerTitleItem) {
            self.datePickerTitleItem = [[MMMainTitleItem alloc] init];
        }
        self.datePickerTitleItem.title = [self.datePickerItem.formatter stringFromDate:self.datePickerItem.selectedDate];
    }
    [self countItems];
    reloadData();
}

- (void)refreshPickerTitleItem:(void(^)(void))reloadData{
    if (!self.pickerItem.selectedDict) {
        self.pickerTitleItem = nil;
    }else{
        if (!self.pickerTitleItem) {
            self.pickerTitleItem = [[MMMainTitleItem alloc] init];
        }
        
        
        self.pickerTitleItem.title = [self datePickerTitle];
    }
    [self countItems];
    reloadData();
}


- (void)refreshSliderTitleItem:(void(^)(void))reloadData{
    if (self.sliderItem.value == 0) {
        self.sliderTitleItem = nil;
    }else{
        if (!self.sliderTitleItem) {
            self.sliderTitleItem = [[MMMainTitleItem alloc] init];
        }
        
        self.sliderTitleItem.title = [NSString stringWithFormat:@"slider value is %.2f",self.sliderItem.value];
    }
    
    [self countItems];
    reloadData();
}

- (void)countItems{
    self.items = [NSMutableArray arrayWithCapacity:10];
    
    if (self.textFieldItem) {
        [self.items addObject:self.textFieldItem];
    }
    
    if (self.datePickerTitleItem) {
        [self.items addObject:self.datePickerTitleItem];
    }
    
    if (self.datePickerItem) {
        [self.items addObject:self.datePickerItem];
    }
    
    if (self.pickerTitleItem) {
        [self.items addObject:self.pickerTitleItem];
    }
    
    if (self.pickerItem) {
        [self.items addObject:self.pickerItem];
    }
    
    if (self.sliderTitleItem) {
        [self.items addObject:self.sliderTitleItem];
    }
    
    if (self.sliderItem) {
        [self.items addObject:self.sliderItem];
    }
    
    if (self.cycleScrollItem) {
        [self.items addObject:self.cycleScrollItem];
    }
    
    if (self.switchItem) {
        [self.items addObject:self.switchItem];
    }
    
    if (self.segmentItem) {
        [self.items addObject:self.segmentItem];
    }
}

- (NSString *)datePickerTitle{
    NSInteger row1 = [self.pickerItem.selectedDict[@"rowOfComponentOne"] integerValue];
    NSInteger row2 = [self.pickerItem.selectedDict[@"rowOfComponentTwo"] integerValue];
    
    NSString *str1 = self.pickerItem.kindArray[row1];
    
    NSArray *elementArray = self.pickerItem.elementArray[row1];
    
    NSString *str2 = elementArray[row2];
    
    return [NSString stringWithFormat:@"%@ - %@",str1,str2];
}

- (void)createPickerSourceData{
    self.pickerItem.kindArray = @[@"动物",@"植物",@"微生物"];
    NSArray *animal = @[@"猴子",@"大象",@"猫",@"狗",@"鳄鱼",@"河马",@"老虎",@"大熊猫",@"恐龙",@"蛇"];
    NSArray *plant = @[@"杨树",@"海棠",@"玫瑰",@"月季",@"兰花草",@"茶树",@"仙人掌"];
    NSArray *microorganism = @[@"大肠杆菌",@"乳酸菌",@"T病毒",@"螺旋菌",@"香菇"];
    
    self.pickerItem.elementArray = @[animal,plant,microorganism];
}

- (void)createCycleSourceData{
    NSArray *dogs = @[@"dog_1.jpg",@"dog_2.jpg",@"dog_3.jpg"];
    
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:dogs.count];
    for (NSString *dName in dogs) {
        MMCycleScrollElementItem *aItem = [[MMCycleScrollElementItem alloc] init];
        aItem.imageName = dName;
        [items addObject:aItem];
    }
    
    self.cycleScrollItem.items = items;
}

- (void)createSegmentSourceData{
    NSArray *segments = @[@"富强福",@"和谐福",@"友善福",@"爱国福",@"敬业福"];
    self.segmentItem.items = segments;
    self.segmentItem.selectedIndex = 2;
}
@end
