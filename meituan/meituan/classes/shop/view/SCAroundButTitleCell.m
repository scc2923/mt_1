//
//  SCAroundButTitleCell.m
//  meituan
//
//  Created by scc on 16/4/14.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCAroundButTitleCell.h"

@implementation SCAroundButTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *jfMineBigTitleCell = @"SCAroundButTitleCell";
    SCAroundButTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:jfMineBigTitleCell];
    if (cell == nil) {
        cell = [[SCAroundButTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jfMineBigTitleCell];
    }
    
    cell.textLabel.text = @"附近团购";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


@end
