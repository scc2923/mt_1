//
//  SCOtherRecommentCell.h
//  meituan
//
//  Created by scc on 16/4/11.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCShopRecoummentModel.h"
@interface SCOtherRecommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic ,strong)SCShopRecoummentModel *shopRecommentModel;
@end
