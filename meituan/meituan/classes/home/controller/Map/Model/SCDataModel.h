//
//  SCDataModel.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDataModel : NSObject
/**
 *  标题
 */
@property(nonatomic, strong) NSString *mname;//标题
/**
 *  价格
 */
@property(nonatomic, strong) NSNumber *price;//价格
/**
 *  图片的URL
 */
@property(nonatomic, strong) NSString *imgurl;//图片
/**
 *  经纬度
 */
@property(nonatomic, strong) NSMutableArray *rdplocs;//坐标等
/**
 *  提供一个类方法
 *
 *  @param dict 给我一个字典
 *
 *  @return 返回一个模型
 */
+(instancetype)dataModelWithDict:(NSDictionary *)dict;

/**
 *  提供一个实力方法
 *
 *  @param dict 传进一个字典
 *
 *  @return 注意：构造方法一定要调用父类的方法
 */
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
