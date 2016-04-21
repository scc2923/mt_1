//
//  SCmerchanHeaderModel.m
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCmerchanHeaderModel.h"

@implementation SCmerchanHeaderModel
+(instancetype)headerModel:(NSDictionary *)dict{
    return  [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        /**
         *  这个地方如果用KVC 的话有局限性，因为他都是一一对应的，少一个都不行
         */
        //[self setValuesForKeysWithDictionary:dict];
        self.detail = dict[@"detail"];
        self.province = dict[@"province"];
    }
    return self;
}

@end
