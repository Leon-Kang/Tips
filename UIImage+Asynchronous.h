//
//  UIImage+Tool.h
//  Koko
//
//  Created by Leon Kang on 2018/12/17.
//  Copyright © 2018 Ideawise Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Asynchronous)

- (void)imageWithImageName:(NSString *)imageName block:(void(^)(UIImage *image))block;

@end
