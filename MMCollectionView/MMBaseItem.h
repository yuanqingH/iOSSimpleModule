//
//  MMBaseItem.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMViewItemProtocol.h"
@interface MMBaseItem : NSObject<MMViewItemProtocol>
//记录view的size
@property (nonatomic,assign) CGSize size;

//返回这个item对应view的类型
- (Class)viewClass;
@end
