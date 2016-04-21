//
//  SCTabBar.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCTabBar.h"
#import "SCTabBarButton.h"
@implementation SCTabBar
-(void)addTabBarButtonWithItem:(UITabBarItem *)item{
    //1.创建按钮
    SCTabBarButton *button = [[SCTabBarButton alloc]init];
    [self addSubview:button];
    //设置数据把buttonitem模型传给button
    button.item = item;
    
    //监听点击button
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //默认选中
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}
/**
 * button监听事件
 *
 */
-(void)buttonClick:(SCTabBarButton*)button{
    
    if ([self.delegate respondsToSelector:@selector(tabBar: didselectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didselectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width/ self.subviews.count ;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0 ;
    
    for ( int index = 0; index < self.subviews.count; index++) {
        //1.取出按钮
        SCTabBarButton *button = self.subviews[index];
        
        //2. 设置按钮的frame
        
        CGFloat buttonX = index * buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH) ;
        
        //绑定tag;
        button.tag = index;
    }


}
@end
