//
//  MMBaseCollectionViewCell.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseCollectionViewCell.h"

@interface MMBaseCollectionViewCell()
@property (nonatomic,strong) MMBaseItem *obj;
@end
@implementation MMBaseCollectionViewCell
+ (NSString *)viewIdentifier{
    return NSStringFromClass(self);
}

- (void)setObject:(MMBaseItem *)obj{
    if (obj) {
        _obj = obj;
    }else{
        _obj = nil;
    }
}

- (MMBaseItem *)elementItem{
    return _obj;
}


+ (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForObject:(MMBaseItem *)object{
    return object.size;
}


+ (void)registerSelf:(UICollectionView *)collectionView{
    [collectionView registerClass:self forCellWithReuseIdentifier:[self viewIdentifier]];
}
@end
