//
//  MMCycleScrollView.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMCycleScrollView.h"
#import "MMCollectionViewDataSource.h"
#import "MMCycleScrollElementCell.h"
#import "MMWeakTimerStrategy.h"

#import "MMCycleTagPointView.h"

@interface MMCycleScrollView()<UICollectionViewDelegate,MMWeakTimerStrategyDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) id<UICollectionViewDataSource> dataSource;

@property (nonatomic,strong) NSArray *item;

@property (nonatomic,strong) MMWeakTimerStrategy *timerStrategy;

@property (nonatomic,assign) NSInteger currentPageIndex;

@property (nonatomic,strong) MMCycleTagPointView *pointView;
@end
@implementation MMCycleScrollView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCollectionView];
        self.timerStrategy = [[MMWeakTimerStrategy alloc] init];
        self.timerStrategy.delegate = self;
    }
    
    return self;
}

- (void)createPointView{
    if (self.pointView) {
        [self.pointView removeFromSuperview];
        self.pointView = nil;
    }
    
    self.pointView = [[MMCycleTagPointView alloc] initWithItems:_cycleItems currentIndex:0];
    [self addSubview:self.pointView];
    
    CGRect rect = self.pointView.frame;
    rect.origin.x = (self.bounds.size.width - rect.size.width)/2;
    rect.origin.y = self.bounds.size.height - rect.size.height - 10;
    
    self.pointView.frame = rect;
}



- (void)createCollectionView{
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:[self collectionViewLayout]];
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.scrollEnabled = NO;
    [self addSubview:self.collectionView];
    
    [self registerCell];
}

//设置collectionView的layout
- (UICollectionViewLayout *)collectionViewLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return layout;
}


#pragma mark dataSource
-(void)setDataSource:(id<UICollectionViewDataSource>)dataSource{
    if (dataSource != _dataSource) {
        _dataSource = dataSource;
        _collectionView.dataSource = nil;
    }
    
    _collectionView.dataSource = _dataSource;
    [_collectionView reloadData];
}


- (void)reloadData{
    MMCollectionViewDataSource *dataSource = [[MMCollectionViewDataSource alloc] initItems:self.items];
    self.dataSource = dataSource;
    
    if(self.items.count > 1){
         [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        self.currentPageIndex = 1;
        [self createPointView];
        [self.timerStrategy fire];
    }
    
}



#pragma mark - MMWeakTimerStrategyDelegate
- (void)timerAction{
    NSInteger count = self.items.count;
    if (self.currentPageIndex == (count - 1)) {
        //表示到了最后一个 也就是假的头
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentPageIndex  = 2;
        
        [self.pointView scrollToIndex:1];
        
    }else{
        self.currentPageIndex ++;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.currentPageIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        NSInteger pointIndex = (self.currentPageIndex - 1) % _cycleItems.count;
        [self.pointView scrollToIndex:pointIndex];
    }
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    MMCycleScrollElementItem *aItem = self.items[row];
    
    if ([self.delegate respondsToSelector:@selector(didClickCycleScrollView:atIndex:)]) {
        NSInteger pointIndex = (self.currentPageIndex - 1) % _cycleItems.count;
        [self.delegate didClickCycleScrollView:aItem atIndex:pointIndex];
    }
}



- (void)registerCell{
    [MMBaseCollectionViewCell registerSelf:self.collectionView];
    [MMCycleScrollElementCell registerSelf:self.collectionView];
}

- (void)dealloc{
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
    
    [self.timerStrategy invalidate];
}



- (NSArray *)items{
    if (_cycleItems.count == 0) {
        return @[];
    }
    
    NSInteger count = _cycleItems.count == 1? 1 : _cycleItems.count + 2;
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:count];
    
    [temp addObjectsFromArray:_cycleItems];
    
    if (count > 1) {
        MMCycleScrollElementItem *preElement = [[MMCycleScrollElementItem alloc] init];
        preElement = _cycleItems.lastObject;
        [temp insertObject:preElement atIndex:0];
        
        MMCycleScrollElementItem *lastElement = [[MMCycleScrollElementItem alloc] init];
        lastElement = _cycleItems[0];
        [temp addObject:lastElement];
    }
    
    
    return temp;
}
@end
