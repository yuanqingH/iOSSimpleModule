//
//  MMMainCellDelegateStrategy.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseStrategy.h"
#import <UIKit/UIKit.h>

@interface MMMainCellDelegateStrategy : MMBaseStrategy
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;
@end
