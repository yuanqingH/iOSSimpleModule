//
//  ViewController.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "ViewController.h"
#import "MMMainController.h"
#import <objc/runtime.h>

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self logAllProtertiesOfSegmentControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openPage:(id)sender {
    MMMainController *mmMainVCL = [[MMMainController alloc] init];
    [mmMainVCL view];
    
    [self presentViewController:mmMainVCL animated:YES
                     completion:^{
                         
                     }];
}



- (void)logAllProtertiesOfSegmentControl{
    // 获取当前类的所有属性
    unsigned int count;// 记录属性个数
    objc_property_t *properties = class_copyPropertyList([UISegmentedControl class], &count);
    // 遍历
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        // An opaque type that represents an Objective-C declared property.
        // objc_property_t 属性类型
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    
    [mArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@\n",obj);
    }];
}

@end
