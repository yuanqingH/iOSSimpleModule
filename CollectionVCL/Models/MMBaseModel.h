//
//  MMBaseModel.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMBaseModel : NSObject
@property (nonatomic,strong) NSMutableArray *items;

- (void)loadItems:(NSDictionary *)paramters completion:(void(^)(NSDictionary *))completion failure:(void(^)(NSError *))failure;
@end
