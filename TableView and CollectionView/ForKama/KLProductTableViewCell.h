//
//  KLProductTableViewCell.h
//  ForKama
//
//  Created by 康梁 on 2016/10/6.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLIndexCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

extern NSString *const kProductTableViewCell;

@interface KLProductTableViewCell : UITableViewCell

@property (nonatomic, strong) KLIndexCollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
