- (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 {
    UIGraphicsBeginImageContext(image2.size);
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    [image1 drawInRect:CGRectMake(20, 20, image1.size.width, image1.size.height)];

    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return resultImage;
}