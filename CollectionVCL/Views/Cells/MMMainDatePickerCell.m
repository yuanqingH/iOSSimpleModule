//
//  MMMainDatePickerCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainDatePickerCell.h"
#import "MMMainDatePickerItem.h"

@interface MMMainDatePickerCell()
@property (nonatomic,strong) UIDatePicker *datePicker;
@end

@implementation MMMainDatePickerCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createDatePicker];
    }
    
    return self;
}

- (void)createDatePicker{
    self.datePicker = [[UIDatePicker alloc] initWithFrame:self.bounds];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    NSDate *now = [NSDate date];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //设置时间
    [offsetComponents setYear:10];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:0];
    [offsetComponents setHour:0];
    [offsetComponents setMinute:0];
    [offsetComponents setSecond:0];
    //设置最大值时间
    NSDate *maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:now options:0];
    //设置属性
    self.datePicker.minimumDate = now;
    self.datePicker.maximumDate = maxDate;
    [self.contentView addSubview:self.datePicker];
}

- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainDatePickerItem class]]){
        MMMainDatePickerItem *aItem = (MMMainDatePickerItem *)obj;
        if (!aItem.selectedDate) {
            return;
        }
        
        NSComparisonResult result = [self.datePicker.date compare:aItem.selectedDate];
        if (result != NSOrderedSame) {
            self.datePicker.date = aItem.selectedDate;
        }
    }
}

- (void)dateChanged:(id)sender{
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate *date = control.date;
    if([self.elementItem isKindOfClass:[MMMainDatePickerItem class]]){
        MMMainDatePickerItem *aItem = (MMMainDatePickerItem *)self.elementItem;
        NSComparisonResult result = [date compare:aItem.selectedDate];
        if (result != NSOrderedSame) {
            aItem.selectedDate = date;
            //不相等 刷新
            if ([self.delegate respondsToSelector:@selector(datePickerValueChange:)]) {
                [self.delegate datePickerValueChange:date];
            }
        }
        
    }
}

@end
