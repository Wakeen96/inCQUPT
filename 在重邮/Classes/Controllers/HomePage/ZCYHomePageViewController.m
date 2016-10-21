//
//  ZCYHomePageViewController.m
//  在重邮
//
//  Created by 周维康 on 16/10/15.
//  Copyright © 2016年 周维康. All rights reserved.
//

#import "ZCYHomePageViewController.h"

@interface ZCYHomePageViewController () <UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UIScrollView *backgroundScrollView;  /**< 背景下拉板 */
@property (strong, nonatomic) UICollectionView *functionCollectionView;  /**< 功能板块 */
@end

@implementation ZCYHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    self.view.backgroundColor = kAppBg_Color;
    [self setNavigationBar];
    [self initBackgroundScrollView];
    
}

- (void)setNavigationBar
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)initBackgroundScrollView
{
    self.backgroundScrollView = [[UIScrollView alloc] init];
    self.backgroundScrollView.backgroundColor = kCommonWhite_Color;
    self.backgroundScrollView.delegate = self;
    self.backgroundScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    self.backgroundScrollView.contentOffset = CGPointMake(0, 0);
    [self.view addSubview:self.backgroundScrollView];
    [self.backgroundScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.bottom.equalTo(self.view);
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.functionCollectionView dequeueReusableCellWithReuseIdentifier:@"functionCollectionViewCellID" forIndexPath:indexPath];
    return cell;
}
@end
