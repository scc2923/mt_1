//
//  SCSearchHistoryCell.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSearchHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *searchHistoryLabel;
- (IBAction)cancelSearchBtnClick:(id)sender;

+(instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas;
@end
