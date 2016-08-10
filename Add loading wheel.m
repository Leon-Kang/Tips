- (void)setLoadingProfile:(BOOL)loadingProfile {
    _loadingProfile = loadingProfile;
    
    CABasicAnimation *animation = [CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0)];
    animation.duration = 0.5;
    animation.cumulative = YES;
    animation.repeatCount = HUGE_VALF;
    
    if (loadingProfile == YES) {
        [self bringSubviewToFront:loadingImageView];
        [loadingImageView.layer addAnimation:animation forKey:@"loadingTransfom"];
        loadingImageView.hidden = NO;
    } else {
        [loadingImageView.layer removeAnimationForKey:@"loadingTransfom"];
        loadingImageView.hidden = YES;
    }
}