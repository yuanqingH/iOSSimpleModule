//
//  MMViewTypeProtocol.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMBaseItem.h"

@protocol MMViewTypeProtocol <NSObject>
@property (nonatomic,strong,readonly) MMBaseItem *elementItem;
+ (NSString *)viewIdentifier;
@end
