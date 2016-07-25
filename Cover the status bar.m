	UIApplication *app = [UIApplication sharedApplication];

    UIWindow *overlapView = [UIWindow new];
    overlapView.windowLevel = UIWindowLevelStatusBar + 1;
    overlapView.frame = app.statusBarFrame;
	// P.S. instance of UIWindow is set hidden = YES by default, so you should set hidden = NO when you want to display the overlapView;