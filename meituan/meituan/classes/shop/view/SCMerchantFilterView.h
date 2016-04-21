//
//  SCMerchantFilterView.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCMerchantFilterViewDelegate <NSObject>

@optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath withId:(NSNumber *)ID ;

@end

@interface SCMerchantFilterView : UIView
/**
 *  全部分类的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfGroup;

/**
 *  每组详情的tableView
 */
@property(nonatomic, strong) UITableView *tableViewOfDetail;

@property (nonatomic, weak) id <SCMerchantFilterViewDelegate> delegate;


@end
