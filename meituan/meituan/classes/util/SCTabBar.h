//
//  SCTabBar.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCTabBarButton.h"
@class SCTabBar;

//给每个按钮定义协议与方法
@protocol tabbarDelegate <NSObject>
@optional
-(void)tabBar:(SCTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to;

@end
@interface SCTabBar : UIView
@property(nonatomic,weak)SCTabBarButton *selectedButton;
/**
 *  给自定义的tabbar添加按钮
 */
-(void)addTabBarButtonWithItem:(UITabBarItem *)itme;
@property(nonatomic , weak) id <tabbarDelegate> delegate;
@end
