//
//  SCMineModel.h
//  JFMeiTuan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCMineModel : NSObject
/**
 *  标题
 */
@property (nonatomic ,copy)NSString *title;
/**
 *  图片名
 */
@property (nonatomic ,copy)NSString *imageName;
+(instancetype)mineModel:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
