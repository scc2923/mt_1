//
//  SCRushBuyCell.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCRushBuyCellDelegate <NSObject>
@optional
-(void)didSelectAtIndexRushBuyCell:(long )index;
@end
@interface SCRushBuyCell : UITableViewCell
/**
 *  快速创建一个cell
 返回值用instancetype 代替id苹果的规范
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;
/**
 *  提供一个构造实例方法方法用来给在控制器里面创建cell, 传递模型
 *
 */
-(void)setRushData:(NSMutableArray *)rushData;

@property(nonatomic ,weak)id<SCRushBuyCellDelegate>delegate;
@end
