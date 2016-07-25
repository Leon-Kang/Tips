#pragma mark - UICollectionViewDataSource

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_inDemoMode) {
        return CGSizeMake(SCREEN_WIDTH/6, SCREEN_WIDTH/6);
    }
    return CGSizeMake(64, 64);
}