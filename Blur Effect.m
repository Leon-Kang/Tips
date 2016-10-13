	UIBlurEffect *effect1 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView1 = [[UIVisualEffectView alloc] initWithEffect:effect1];
    effectView1.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    effectView1.frame = CGRectMake(0, 0, imageView.frame.size.width / 2, imageView.frame.size.height / 2);