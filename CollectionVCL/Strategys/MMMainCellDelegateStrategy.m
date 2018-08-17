//
//  MMMainCellDelegateStrategy.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainCellDelegateStrategy.h"
#import "MMMainController.h"
#import "MMMainModel.h"
#import "MMMainDatePickerCell.h"
#import "MMMainPickerCell.h"
#import "MMMainSliderCell.h"
#import "MMMainCycleScrollCell.h"


@interface MMMainCellDelegateStrategy()<MMMainDatePickerCellDelegate,MMMainPickerCellDelegate,MMMainSliderCellDelegate,MMMainCycleScrollCellDelegate>

@end

@implementation MMMainCellDelegateStrategy

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell isKindOfClass:[MMMainDatePickerCell class]]) {
        MMMainDatePickerCell *aCell = (MMMainDatePickerCell *)cell;
        aCell.delegate = self;
    }else if ([cell isKindOfClass:[MMMainPickerCell class]]){
        MMMainPickerCell *aCell = (MMMainPickerCell *)cell;
        aCell.delegate = self;
    }else if ([cell isKindOfClass:[MMMainSliderCell class]]){
        MMMainSliderCell *aCell = (MMMainSliderCell *)cell;
        aCell.delegate = self;
    }else if ([cell isKindOfClass:[MMMainCycleScrollCell class]]){
        MMMainCycleScrollCell *aCell = (MMMainCycleScrollCell *)cell;
        aCell.delegate = self;
    }
}


#pragma mark - MMBaseCollectionViewCellDelegate
- (void)datePickerValueChange:(NSDate *)date{
    MMMainController *targetVCL = (MMMainController *)self.target;
    MMMainModel *model = (MMMainModel *)targetVCL.model;
    
    __weak typeof(targetVCL) weakTarget = targetVCL;
    [model refreshDatePickerTitleItem:^{
        [weakTarget reloadData];
    }];
}


#pragma mark - MMBaseCollectionViewCellDelegate
- (void)pickerValueChange:(NSDictionary *)selectedDict{
    MMMainController *targetVCL = (MMMainController *)self.target;
    MMMainModel *model = (MMMainModel *)targetVCL.model;
    
    __weak typeof(targetVCL) weakTarget = targetVCL;
    [model refreshPickerTitleItem:^{
        [weakTarget reloadData];
    }];
}

#pragma mark - MMMainSliderCellDelegate
- (void)sliderValueDidChange:(float)value{
    MMMainController *targetVCL = (MMMainController *)self.target;
    MMMainModel *model = (MMMainModel *)targetVCL.model;
    
    __weak typeof(targetVCL) weakTarget = targetVCL;
    [model refreshSliderTitleItem:^{
        [weakTarget reloadData];
    }];
}

#pragma mark - MMMainCycleScrollCellDelegate


- (void)didClickCycleScrollView:(MMCycleScrollElementItem *)item atIndex:(NSInteger)index{
    NSString *message =[NSString stringWithFormat:@"你点击的是第%ld个 图片名字为%@",index,item.imageName];
    UIAlertController *alerytController = [UIAlertController alertControllerWithTitle:@"轮播试图点击" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了Sure按钮");
    }];
    
    [alerytController addAction:sureAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了Cancel按钮");
    }];
    
    [alerytController addAction:cancelAction];
    
    MMMainController *targetVCL = (MMMainController *)self.target;
    [targetVCL presentViewController:alerytController animated:YES completion:^{
        
    }];
}


@end
