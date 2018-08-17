//
//  MMMainModel.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseModel.h"

@interface MMMainModel : MMBaseModel
//当datepicker值变化的时候更新DatePickerTitleItem方法
- (void)refreshDatePickerTitleItem:(void(^)(void))reloadData;
//picker值变化的时候更新pickerTitleItem方法
- (void)refreshPickerTitleItem:(void(^)(void))reloadData;
//slider值变化的时候更新sliderTitleItem方法
- (void)refreshSliderTitleItem:(void(^)(void))reloadData;
@end
