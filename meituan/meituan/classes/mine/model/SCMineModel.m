//
//  SCMineModel.m
//  JFMeiTuan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "SCMineModel.h"

@implementation SCMineModel
+(instancetype)mineModel:(NSDictionary *)dict{
    return  [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        /**
         *  这个地方如果用KVC 的话有局限性，因为他都是一一对应的，少一个都不行
         */
        //[self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.imageName = dict[@"image"];
    }
    return self;
}

@end
