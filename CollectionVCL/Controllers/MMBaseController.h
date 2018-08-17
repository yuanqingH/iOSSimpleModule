//
//  MMBaseController.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBaseModel.h"
#import "MMCollectionViewDataSource.h"

@interface MMBaseController : UIViewController
@property (nonatomic,strong) MMBaseModel *model;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) id<UICollectionViewDataSource> dataSource;

- (void)initStrategy;
- (void)registerCell;
- (void)loadItems;
- (void)reloadData;
@end
