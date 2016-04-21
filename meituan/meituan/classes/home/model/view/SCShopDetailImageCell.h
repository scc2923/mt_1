//
//  SCShopDetailImageCell.h
//  meituan
//
//  Created by scc on 16/4/10.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCShopDatailDataModel.h"
@interface SCShopDetailImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)SCShopDatailDataModel *detailModel;
@end
