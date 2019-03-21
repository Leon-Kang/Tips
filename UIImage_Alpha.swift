//
//  UIImage_Alpha.swift
//  Koko
//
//  Created by Leon Kang on 2019/3/18.
//  Copyright © 2019 Ideawise Ltd. All rights reserved.
//

import Foundation


extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
