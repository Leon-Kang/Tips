//
//  KLProductCollectionViewCell.m
//  ForKama
//
//  Created by 康梁 on 16/8/16.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "KLProductCollectionViewCell.h"

NSString *const kProductCollectionCellIdentifier = @"productCell";

@interface KLProductCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIVisualEffectView *effectView;
@property (nonatomic, weak) IBOutlet UIImageView *productPhoto;

@end

@implementation KLProductCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLProductCollectionViewCell class]) owner:self options:nil] firstObject];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    _effectView.effect = effect;
}


- (void)addBlurEffect {
    
    
    if (_effectView == nil) {
        
    }
    
}

- (void)setHaveImages:(BOOL)haveImages {
    _haveImages = haveImages;
}



@end
