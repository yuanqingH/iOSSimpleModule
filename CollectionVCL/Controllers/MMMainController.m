//
//  MMMainController.m
//  MMFirstDemo
//
//  Created by MOMO on 2017/5/18.
//  Copyright © 2017年 huang.yuanqing. All rights reserved.
//

#import "MMMainController.h"
#import "MMMainModel.h"


#import "MMMainCellDelegateStrategy.h"
#import "MMMainRigsterCellStrategy.h"

@interface MMMainController ()
//用来处理cell的代理的策略类
@property (nonatomic,strong) MMMainCellDelegateStrategy *cellDelegateStrategy;

@property (nonatomic,strong) MMMainRigsterCellStrategy *registerCellStrategy;
@end

@implementation MMMainController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.model = [[MMMainModel alloc] init];
    
    [self createBackButton];
    [self loadItems];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initStrategy{
    [super initStrategy];
    self.cellDelegateStrategy = [[MMMainCellDelegateStrategy alloc] initWithTarget:self];
    self.registerCellStrategy = [[MMMainRigsterCellStrategy alloc] initWithTarget:self];
}


- (void)createBackButton{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"返回上页" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor redColor];
    
    backButton.frame = CGRectMake(0, 0, self.view.bounds.size.width, 64);
    
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)goBack{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - loadItems
- (void)loadItems{
    MMMainModel *model = (MMMainModel *)self.model;
    __weak typeof(self) weakSelf = self;
    [model loadItems:nil completion:^(NSDictionary *dict) {
        [weakSelf reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)reloadData{
    MMCollectionViewDataSource *dataSource = [[MMCollectionViewDataSource alloc] initItems:self.model.items];
    self.dataSource = dataSource;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.cellDelegateStrategy collectionView:collectionView willDisplayCell:cell forItemAtIndexPath:indexPath];
}

#pragma mark - registerCell
- (void)registerCell{
    [super registerCell];
    [self.registerCellStrategy registerCell];
}

- (void)dealloc{

}
@end
