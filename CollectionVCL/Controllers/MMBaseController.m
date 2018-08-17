//
//  MMBaseController.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/19.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMBaseController.h"
#import "MMBaseCollectionViewCell.h"

@interface MMBaseController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@end

@implementation MMBaseController
//设置collectionView的layout
- (UICollectionViewLayout *)collectionViewLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(50, 50);
    return layout;
}

- (CGRect)collectionViewFrame{
    return CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
}

- (void)dealloc{
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[self collectionViewFrame] collectionViewLayout:[self collectionViewLayout]];
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.collectionView];
    
    [self initStrategy];
    [self registerCell];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initStrategy{

}

- (void)loadItems{

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
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView.dataSource isKindOfClass:[MMCollectionViewDataSource class]]) {
        MMCollectionViewDataSource *dc = collectionView.dataSource;
        id object = [dc collectionView:collectionView objectForIndexPath:indexPath];
        Class cellClass = [dc collectionView:collectionView cellClassForObject:object];
        return [cellClass collectionView:collectionView layout:collectionViewLayout sizeForObject:object];
    } else {
        return CGSizeZero;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}



- (void)registerCell{
    [MMBaseCollectionViewCell registerSelf:self.collectionView];
}


@end
