//
//  SCSearchHeaderView.h
//  JFMeiTuan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSearchHeaderView : UIView

+ (instancetype)headViewWithTableView:(UITableView *)tableView ;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end
