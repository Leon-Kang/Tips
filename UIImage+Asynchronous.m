//
//  UIImage+Tool.m
//  Koko
//
//  Created by Leon Kang on 2018/12/17.
//  Copyright © 2018 Ideawise Ltd. All rights reserved.
//

#import "UIImage+Asynchronous.h"

@implementation UIImage (Asynchronous)

- (void)imageWithImageName:(NSString *)imageName block:(void(^)(UIImage *image))block {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @autoreleasepool {
            UIImage *image = [UIImage imageNamed:imageName];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (block) {
                    block(image);
                }
            });
        }
    });
}

@end
