- (void)awakeAvatarWith:(UIImageView *)imageView {
    // Placeholder
    CGRect frame = imageView.bounds;
    
    UIBezierPath *polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint:CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02500 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint:CGPointMake(CGRectGetMinX(frame) + 0.97500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint:CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97500 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint:CGPointMake(CGRectGetMinX(frame) + 0.02500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint:CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02500 * CGRectGetHeight(frame))];
    [polygonPath closePath];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = polygonPath.CGPath;
    imageView.layer.mask = maskLayer;
}