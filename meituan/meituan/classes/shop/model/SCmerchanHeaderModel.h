//
//  SCmerchanHeaderModel.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCmerchanHeaderModel : NSObject
/**
 *  详细地址
 */
@property (nonatomic ,copy)NSString *detail;
/**
 *  省份
 */
@property (nonatomic ,copy)NSString *province;

+(instancetype)headerModel:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
