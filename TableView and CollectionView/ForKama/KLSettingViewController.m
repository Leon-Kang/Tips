//
//  KLSettingViewController.m
//  ForKama
//
//  Created by 康梁 on 16/8/16.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "KLSettingViewController.h"

NSString *const kSettingViewControllerStoryboardId = @"settingViewController";

@interface KLSettingViewController () <UITabBarDelegate>

@end

@implementation KLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    tabBar.backgroundColor = [UIColor blueColor];
    tabBar.alpha = 0.4;
    
}

@end
