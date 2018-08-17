//
//  MMBaseModel.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseModel.h"

@implementation MMBaseModel
- (id)init{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray arrayWithCapacity:20];
    }
    
    return self;
}

//override
- (void)loadItems:(NSDictionary *)paramters completion:(void(^)(NSDictionary *))completion failure:(void(^)(NSError *))failure{
    
}
@end
