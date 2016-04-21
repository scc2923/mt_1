//
//  SCHotQueueCell.h
//  JFMeiTuan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCHotQueueModel.h"
@interface SCHotQueueCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotQueueImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@property(nonatomic,strong)SCHotQueueModel *hotQueueModel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
