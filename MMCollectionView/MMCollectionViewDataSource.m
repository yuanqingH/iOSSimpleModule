//
//  MMCollectionViewDataSource.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMCollectionViewDataSource.h"

@implementation MMCollectionViewDataSource

#pragma mark - init方法
- (instancetype)initItems:(NSMutableArray *)items{
    return [self initItems:items reusableViewItems:nil];
}

- (instancetype)initSectionItems:(NSMutableArray *)sectionItems{
    return [self initSectionItems:sectionItems reusableViewItems:nil];
}

- (instancetype)initItems:(NSMutableArray *)items reusableViewItems:(NSMutableArray *)reusableViewItems{
    self = [super init];
    if (self) {
        self.items = items;
        self.reusableViewItems = reusableViewItems;
    }
    
    return self;
}

- (instancetype)initSectionItems:(NSMutableArray *)sectionItems reusableViewItems:(NSMutableArray *)reusableViewItems{
    self = [super init];
    if (self) {
        self.sectionsItems = sectionItems;
        self.reusableViewItems = reusableViewItems;
    }
    return self;
}

#pragma mark - 私有方法
//获取对应indexpath的cell的Class
- (Class)collectionView:(UICollectionView *)collectionView cellClassForObject:(MMBaseItem *)elementItem{
    return [elementItem viewClass];
}

//获取对应indexpath的cell的数据源item
- (MMBaseItem *)collectionView:(UICollectionView *)collectionView objectForIndexPath:(NSIndexPath *)indexPath{
    NSArray *temp = [self.items copy];
    if (self.sectionsItems.count > 0) {
        if (indexPath.section >= 0 && indexPath.section < self.sectionsItems.count) {
            temp = [self.sectionsItems[indexPath.section] copy];
        }
    }
    
    if (indexPath.row >= 0 && temp.count > indexPath.row) {
        return temp[indexPath.row];
    }
    
    return nil;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sectionsItems.count!= 0? self.sectionsItems.count : 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *temp = [self.items copy];
    if (self.sectionsItems.count > 0) {
        if (section >= 0 && section < self.sectionsItems.count) {
            temp = [self.sectionsItems[section] copy];
        }
    }
    
    return temp.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MMBaseItem *item = [self collectionView:collectionView objectForIndexPath:indexPath];
    
    UICollectionViewCell *cell = nil;
    if (item) {
        Class cellClass = [self collectionView:collectionView cellClassForObject:item];
        NSString *mmIndentifier = [cellClass viewIdentifier];
        if (mmIndentifier.length == 0) {
            mmIndentifier = @"MMBaseCollectionViewCell";
        }
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:mmIndentifier forIndexPath:indexPath];
        if ([cell isKindOfClass:[MMBaseCollectionViewCell class]]) {
            MMBaseCollectionViewCell *mmCell = (MMBaseCollectionViewCell *)cell;
            [mmCell setObject:item];
        }
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    }
    
    return cell;
}
@end
