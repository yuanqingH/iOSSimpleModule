//
//  MMMainRigsterCellStrategy.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainRigsterCellStrategy.h"
#import "MMMainController.h"

#import "MMMainTitleCell.h"
#import "MMMainDatePickerCell.h"
#import "MMMainPickerCell.h"
#import "MMMainTextFieldCell.h"
#import "MMMainSliderCell.h"
#import "MMMainCycleScrollCell.h"
#import "MMMainSwitchCell.h"
#import "MMMainSegmentCell.h"


@implementation MMMainRigsterCellStrategy
#pragma mark - registerCell
- (void)registerCell{
    MMMainController *targetVCL = (MMMainController *)self.target;
    [MMMainTitleCell registerSelf:targetVCL.collectionView];
    [MMMainDatePickerCell registerSelf:targetVCL.collectionView];
    [MMMainPickerCell registerSelf:targetVCL.collectionView];
    [MMMainTextFieldCell registerSelf:targetVCL.collectionView];
    [MMMainSliderCell registerSelf:targetVCL.collectionView];
    [MMMainCycleScrollCell registerSelf:targetVCL.collectionView];
    [MMMainSwitchCell registerSelf:targetVCL.collectionView];
    [MMMainSegmentCell registerSelf:targetVCL.collectionView];
}
@end
