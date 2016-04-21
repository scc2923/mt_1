//
//  SCRecommentCell.h
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCRecommentModel.h"
@interface SCRecommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopIntroduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property(nonatomic,strong)SCRecommentModel *recommentModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
