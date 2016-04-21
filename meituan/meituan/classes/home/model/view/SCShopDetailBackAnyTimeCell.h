//
//  SCShopDetailBackAnyTimeCell.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCShopDatailDataModel.h"
@protocol SCShopDetailBackAnyTimeCellDelegate <NSObject>
@optional
-(void)shopDetailBackAnyTimeButtonClick:(UIButton *)button;

@end
@interface SCShopDetailBackAnyTimeCell : UITableViewCell
- (IBAction)backAnyTimeButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *backAnyTimeNumberLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)SCShopDatailDataModel *detailModel;

@property(nonatomic, weak)id<SCShopDetailBackAnyTimeCellDelegate>delegate;
@end
