//
//  MMMainSliderCell.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseCollectionViewCell.h"

@protocol MMMainSliderCellDelegate<NSObject>
- (void)sliderValueDidChange:(float)value;
@end

@interface MMMainSliderCell : MMBaseCollectionViewCell
@property (nonatomic,weak) id<MMMainSliderCellDelegate> delegate;
@end
