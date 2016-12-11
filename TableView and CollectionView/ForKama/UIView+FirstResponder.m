//
// Created by Paolo Tagliani on 12/11/15.
// Copyright (c) 2015 Ideawise Ltd. All rights reserved.
//

#import "UIView+FirstResponder.h"

@implementation UIView (FirstResponder)

- (id)findFirstResponder {
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        id responder = [subView findFirstResponder];
        if (responder) {
            return responder;
        };
    }
    return nil;
}

@end