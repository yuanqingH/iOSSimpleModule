//
//  MMCollectionViewDataSource.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MMBaseItem.h"
#import "MMBaseCollectionViewCell.h"

@interface MMCollectionViewDataSource : NSObject<UICollectionViewDataSource>
//仅有一个section时使用这个数组作为数据源[elementItem]
@property (nonatomic,strong) NSMutableArray *items;
//多个section的时候，每个section的item数组放到这个数组内[[elementItem],[elementItem]...]
@property (nonatomic,strong) NSMutableArray *sectionsItems;

//展示某个section对应的reusableView的elementItem放入这个数组[elementItem]
@property (nonatomic,strong) NSMutableArray *reusableViewItems;

//单个section初始化
- (instancetype)initItems:(NSMutableArray *)items;

//多个section初始化
- (instancetype)initSectionItems:(NSMutableArray *)sectionItems;

//单个section初始化 带reusableViewItems
- (instancetype)initItems:(NSMutableArray *)items reusableViewItems:(NSMutableArray *)reusableViewItems;

//多个section初始化 带reusableViewItems
- (instancetype)initSectionItems:(NSMutableArray *)sectionItems reusableViewItems:(NSMutableArray *)reusableViewItems;

//获取对应indexpath的cell的Class
- (Class)collectionView:(UICollectionView *)collectionView cellClassForObject:(MMBaseItem *)elementItem;

//获取对应indexpath的cell的数据源item
- (MMBaseItem *)collectionView:(UICollectionView *)collectionView objectForIndexPath:(NSIndexPath *)indexPath;
@end
