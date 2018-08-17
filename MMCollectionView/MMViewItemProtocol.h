//
//  MMViewItemProtocol.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol MMViewItemProtocol <NSObject>
@property (nonatomic,assign) CGSize size;
- (Class)viewClass;
@end
