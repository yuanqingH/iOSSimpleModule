//
//  MMCycleTagPointView.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/22.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMCycleTagPointView.h"

static const NSInteger MCycleTagPointViewPointWidth = 10;
static const NSInteger MCycleTagPointViewPointGap = 5;

@interface MMCycleTagPointView()
@property (nonatomic,strong) NSMutableArray *shapeLayers;
@property (nonatomic,strong) CAShapeLayer *redPointLayer;
@end
@implementation MMCycleTagPointView
- (instancetype)initWithItems:(NSArray *)items currentIndex:(NSInteger)index{
    self = [super initWithFrame:CGRectZero];
    if(self){
        NSInteger count = items.count;
        if (count > 0) {
            CGFloat w = count * MCycleTagPointViewPointWidth + (count - 1) * MCycleTagPointViewPointGap;
            self.frame = CGRectMake(0, 0, w, MCycleTagPointViewPointWidth);
            
            [self createPointLayer:items currentIndex:index];
        }
        
    }
    
    return self;
}


- (instancetype)initWithItems:(NSArray *)items{
    return [self initWithItems:items currentIndex:0];
}



- (void)createPointLayer:(NSArray *)items currentIndex:(NSInteger)index{
    if (items.count == 0) {
        return;
    }
    
    self.shapeLayers = [NSMutableArray arrayWithCapacity:items.count];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(MCycleTagPointViewPointWidth/2, MCycleTagPointViewPointWidth/2) radius:MCycleTagPointViewPointWidth/2 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    for (int i = 0;i<items.count;i++) {
        CAShapeLayer *whitePoint = [CAShapeLayer layer];
        whitePoint.path = path.CGPath;
        whitePoint.fillColor = [UIColor whiteColor].CGColor;
        whitePoint.frame = CGRectMake(i* (MCycleTagPointViewPointWidth + MCycleTagPointViewPointGap), 0, MCycleTagPointViewPointWidth, MCycleTagPointViewPointWidth);
        [self.layer addSublayer:whitePoint];
        [self.shapeLayers addObject:whitePoint];
    }
    
    self.redPointLayer = [CAShapeLayer layer];
    self.redPointLayer.path = path.CGPath;
    self.redPointLayer.fillColor = [UIColor redColor].CGColor;
    self.redPointLayer.frame = CGRectMake(index* (MCycleTagPointViewPointWidth + MCycleTagPointViewPointGap), 0, MCycleTagPointViewPointWidth, MCycleTagPointViewPointWidth);
    [self.layer addSublayer:self.redPointLayer];
}


- (void)scrollToIndex:(NSInteger)index{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    CGRect rect = self.redPointLayer.frame;
    rect.origin.x = index* (MCycleTagPointViewPointWidth + MCycleTagPointViewPointGap);
    self.redPointLayer.frame = rect;
    [CATransaction commit];
}


@end
