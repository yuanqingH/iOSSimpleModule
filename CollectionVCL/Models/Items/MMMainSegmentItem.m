//
//  MMMainSegmentItem.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainSegmentItem.h"

@implementation MMMainSegmentItem
- (id)init{
    self = [super init];
    if (self) {
        self.size = CGSizeMake(self.size.width, 100);
    }
    return self;
}
- (Class)viewClass{
    Class cellClass = NSClassFromString(@"MMMainSegmentCell");
    return cellClass;
}
@end
