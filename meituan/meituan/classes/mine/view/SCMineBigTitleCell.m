//
//  SCMineBigTitleCell.m
//  meituan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMineBigTitleCell.h"

@implementation SCMineBigTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *scMineBigTitleCell = @"scmineCell";
    SCMineBigTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:scMineBigTitleCell];
    if (!cell) {
        cell = [[SCMineBigTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scMineBigTitleCell];
    }
    cell.textLabel.text = @"用户";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
