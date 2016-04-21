//
//  SCShopDetailPriceCell.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCShopDatailDataModel.h"
@interface SCShopDetailPriceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nowPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
- (IBAction)rushBuyButtonClick:(id)sender;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)SCShopDatailDataModel *detailModel;
@end
