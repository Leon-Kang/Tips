//
//  KLProduct.h
//  ForKama
//
//  Created by 康梁 on 16/8/16.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import <Realm/Realm.h>

@interface KLProduct : RLMObject

@property (nonatomic, strong) NSString *productNmae;

@property (nonatomic, strong) NSData *picture;

@property (nonatomic, strong) NSDate *productiveTime;
@property (nonatomic, strong) NSDate *expirationTime;
@property (nonatomic, strong) NSDate *expirationDate;


@end


RLM_ARRAY_TYPE(KLProduct)
