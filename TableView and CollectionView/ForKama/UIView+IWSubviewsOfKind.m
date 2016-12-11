//
//  UIView+IWSubviewsOfKind.m
//  flirten
//
//  Created by Diego Freniche Brito on 4/2/16.
//  Copyright © 2016 Ideawise Ltd. All rights reserved.
//

#import "UIView+IWSubviewsOfKind.h"

@implementation UIView (IWSubviewsOfKind)

- (NSArray <UIView *> *)subviewsOfKind:(Class)class {
    NSArray <UIView *> *results = [self filterFiews:self.subviews OfKind:class];
    
    return results;
}

- (NSArray <UIView *> *)filterFiews:(NSArray <UIView *> *)views OfKind:(Class)class {
    NSMutableArray <UIView *> *results = [[NSMutableArray alloc] init];;
    
    if (views == nil || views.count == 0) {
        return nil;
    }
    
    if (views.count == 1){
        if ([views[0] isKindOfClass:class]) {
            [results addObject:views[0]];
        }
        [results addObjectsFromArray:[self filterFiews:[views[0] subviews] OfKind:class]];

    } else {
        [results addObjectsFromArray:[self filterFiews:@[views[0]] OfKind:class]];

        [results addObjectsFromArray:[self filterFiews:[views subarrayWithRange:NSMakeRange(1, views.count-1)] OfKind:class]];
    }
    
    return results;
}



@end
