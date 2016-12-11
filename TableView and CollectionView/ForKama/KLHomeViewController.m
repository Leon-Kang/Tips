//
//  KLHomeViewController.m
//  ForKama
//
//  Created by 康梁 on 16/8/16.#0	0x000000010c27254f in -[KLHomeViewController numberOfSectionsInCollectionView:] at /Users/kl/iOSPersonalProject/ForKama/ForKama/KLHomeViewController.m:47

//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "KLHomeViewController.h"
#import "KLProductCollectionViewCell.h"
#import "KLProductTableViewCell.h"

NSString *const kHomeViewControllerStoryboardId = @"homeViewController";

@interface KLHomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIView *tableViewHeaderView;
@property (nonatomic, weak) IBOutlet UIButton *tablevViewHeaderViewAddBtn;
@property (nonatomic, weak) IBOutlet UILabel *tableViewHeaderViewTitle;

@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation KLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupTableViewController];
    
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark setup method

- (void)configTableViewCell:(UITableViewCell *)cell {
    
}

- (void)setupTableViewController {
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.sectionHeaderHeight = 46;
}

#pragma mark Delegate

#pragma mark TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kProductTableViewCell];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _tableViewHeaderView;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(KLProductTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    NSInteger index = cell.collectionView.indexPath.row;
    
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(KLProductTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat horizontalOffset = cell.collectionView.contentOffset.x;
    NSInteger index = cell.collectionView.indexPath.row;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 256;
}

#pragma mark CollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(KLIndexCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([collectionView indexPath].section == 0) {
        return 10;
    }
    return 40;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KLProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kProductCollectionCellIdentifier forIndexPath:indexPath];
    cell.haveImages = NO;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(244, 280);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark Tabbar
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.alpha = 0.4;
}

#pragma mark - UIScrollViewDelegate Methods
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    KLIndexCollectionView *collectionView = (KLIndexCollectionView *)scrollView;
    NSInteger index = collectionView.indexPath.row;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}

@end
