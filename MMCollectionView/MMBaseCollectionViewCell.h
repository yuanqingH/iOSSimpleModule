//
//  MMBaseCollectionViewCell.h
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMViewTypeProtocol.h"

@interface MMBaseCollectionViewCell : UICollectionViewCell<MMViewTypeProtocol>
@property (nonatomic,strong,readonly) MMBaseItem *elementItem;

- (void)setObject:(MMBaseItem *)obj;

+ (NSString *)viewIdentifier;

+ (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForObject:(MMBaseItem *)object;
+ (void)registerSelf:(UICollectionView *)collectionView;
@end
