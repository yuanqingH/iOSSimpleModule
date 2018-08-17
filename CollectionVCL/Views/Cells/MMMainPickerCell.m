//
//  MMMainPickerCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainPickerCell.h"
#import "MMMainPickerItem.h"

@interface MMMainPickerCell()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) UIPickerView *picker;
@end
@implementation MMMainPickerCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createPicker];
    }
    
    return self;
}

- (void)createPicker{
    self.picker = [[UIPickerView alloc] initWithFrame:self.bounds];
    self.picker.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.picker];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.picker.dataSource = nil;
    self.picker.delegate = nil;
}

- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    if([obj isKindOfClass:[MMMainPickerItem class]]){
        self.picker.dataSource = self;
        self.picker.delegate = self;
        [self.picker reloadAllComponents];
        
        [self resetPickerPosition];
    }
}

- (void)resetPickerPosition{
    MMMainPickerItem *aItem = (MMMainPickerItem *)self.elementItem;
    NSInteger row1 = [aItem.selectedDict[@"rowOfComponentOne"] integerValue];
    NSInteger row2 = [aItem.selectedDict[@"rowOfComponentTwo"] integerValue];
    
    NSInteger currentRow1 = [self.picker selectedRowInComponent:0];
    NSInteger currentRow2 = [self.picker selectedRowInComponent:1];
    
    if (row1!=currentRow1) {
        [self.picker selectRow:row1 inComponent:0 animated:NO];
    }
    if (row2!=currentRow2) {
        [self.picker selectRow:row2 inComponent:1 animated:NO];
    }
}

#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    MMMainPickerItem *aItem = (MMMainPickerItem *)self.elementItem;
    if (component == 0) {
        return aItem.kindArray.count;
    }else{
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        if (selectedRow < aItem.elementArray.count) {
            id data = aItem.elementArray[selectedRow];
            if ([data isKindOfClass:[NSArray class]]) {
                NSArray *elementArray = (NSArray *)data;
                return elementArray.count;
                
            }
        }
    }
    
    return 0;
}



#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    MMMainPickerItem *aItem = (MMMainPickerItem *)self.elementItem;
    if (component == 0 && row < aItem.kindArray.count) {
        return aItem.kindArray[row];
    }else{
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        if (selectedRow < aItem.elementArray.count) {
            id data = aItem.elementArray[selectedRow];
            if ([data isKindOfClass:[NSArray class]]) {
                NSArray *elementArray = (NSArray *)data;
                if (row < elementArray.count) {
                    return elementArray[row];
                }
                
            }
        }
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadAllComponents];
    }
    
    NSInteger currentRow1 = [self.picker selectedRowInComponent:0];
    NSInteger currentRow2 = [self.picker selectedRowInComponent:1];
    
    MMMainPickerItem *aItem = (MMMainPickerItem *)self.elementItem;
    aItem.selectedDict = @{@"rowOfComponentOne":@(currentRow1),@"rowOfComponentTwo":@(currentRow2)};
    
    if ([self.delegate respondsToSelector:@selector(pickerValueChange:)]) {
        [self.delegate pickerValueChange:aItem.selectedDict];
    }
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 150;
    }else{
        return 150;
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 44;
}





@end
