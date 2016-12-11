//
//  UIView+IWSubviewsOfKind.h
//  flirten
//
//  Created by Diego Freniche Brito on 4/2/16.
//  Copyright © 2016 Ideawise Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IWSubviewsOfKind)

- (NSArray <UIView *> *)subviewsOfKind:(Class)class;

@end
