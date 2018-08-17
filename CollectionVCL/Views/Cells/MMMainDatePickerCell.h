//
//  MMMainDatePickerCell.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseCollectionViewCell.h"

@protocol MMMainDatePickerCellDelegate <NSObject>
- (void)datePickerValueChange:(NSDate *)date;
@end

@interface MMMainDatePickerCell : MMBaseCollectionViewCell
@property (nonatomic,weak) id<MMMainDatePickerCellDelegate> delegate;
@end
