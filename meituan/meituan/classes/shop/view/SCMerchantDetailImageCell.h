//
//  SCMerchantDetailImageCell.h
//  meituan
//
//  Created by scc on 16/4/14.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMerchanDetailModel.h"
@interface SCMerchantDetailImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UIImageView *defaultImageView;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *layoutStarView;
+ (instancetype)cellWithTableView:(UITableView *)tableView;


@property(nonatomic, strong)SCMerchanDetailModel *merchantDetailModel;
@end
