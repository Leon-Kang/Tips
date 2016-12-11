//
//  KLProductTableViewCell.m
//  ForKama
//
//  Created by 康梁 on 2016/10/6.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "KLProductTableViewCell.h"
#import "KLProductCollectionViewCell.h"

static NSString *CollectionViewCellIdentifier = @"CollectionViewCellIdentifier";

@implementation KLIndexCollectionView

@end


NSString *const kProductTableViewCell = @"productTableViewCell";

@implementation KLProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
    [self setupCollectionView];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setupCollectionView];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    [self setupCollectionView];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.collectionView.frame = self.contentView.bounds;
}

- (void)setupCollectionView {
    if (self.collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 88);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[KLIndexCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.collectionView registerClass:[KLProductCollectionViewCell class] forCellWithReuseIdentifier:kProductCollectionCellIdentifier];
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.collectionView];
    }
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    
    [self.collectionView reloadData];
}

@end
