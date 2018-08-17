//
//  MMMainTextFieldCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainTextFieldCell.h"
#import "MMMainTextFieldItem.h"

@interface MMMainTextFieldCell()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *textField;
@end
@implementation MMMainTextFieldCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTextField];
    }
    
    return self;
}

- (void)createTextField{
    self.textField = [[UITextField alloc] initWithFrame:self.contentView.bounds];
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.borderStyle = UITextBorderStyleBezel;
    self.textField.placeholder = @"Input...";
    [self.contentView addSubview:self.textField];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    self.textField.text = nil;
    self.textField.delegate = nil;
}

- (void)setObject:(MMBaseItem *)obj{
    [super setObject:obj];
    
    self.textField.delegate = self;
    if([obj isKindOfClass:[MMMainTextFieldItem class]]){
        MMMainTextFieldItem *aItem = (MMMainTextFieldItem *)obj;
        self.textField.text = aItem.recordText;
    }
}



#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *str = textField.text;
    if([self.elementItem isKindOfClass:[MMMainTextFieldItem class]]){
        MMMainTextFieldItem *aItem = (MMMainTextFieldItem *)self.elementItem;
        if (![aItem.recordText isEqualToString:str]) {
            aItem.recordText = str;
        }
    }
}


@end
