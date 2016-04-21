//
//  SCDiscountCell.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCDiscountCellDelegate <NSObject>
@optional
-(void)didSelectAtIndexDiscountCell:(NSString *)urlStr;
@end
@interface SCDiscountCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong) NSMutableArray *discountArray;

@property(nonatomic, weak)id<SCDiscountCellDelegate>delegate;
@end
