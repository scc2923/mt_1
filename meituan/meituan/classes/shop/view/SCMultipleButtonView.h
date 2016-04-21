//
//  SCMultipleButtonView.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCMultipleButtonViewDelegate <NSObject>
@optional
-(void)multipleButtonViewClickAtIndex:(long)index;
@end
@interface SCMultipleButtonView : UIView
{
    UIButton *btn_type;
}
/*
 *快速创建多个按钮
 */
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

@property(nonatomic, weak)id <SCMultipleButtonViewDelegate>delegate;

@end
