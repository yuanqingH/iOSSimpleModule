//
//  MMMainPickerCell.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseCollectionViewCell.h"

@protocol MMMainPickerCellDelegate <NSObject>
- (void)pickerValueChange:(NSDictionary *)selectedDict;
@end


@interface MMMainPickerCell : MMBaseCollectionViewCell
@property (nonatomic,weak) id<MMMainPickerCellDelegate> delegate;
@end
