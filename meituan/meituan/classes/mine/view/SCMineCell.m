//
//  SCMineCell.m
//  meituan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMineCell.h"

@implementation SCMineCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(SCMineModel*)mineModel{
    static NSString *scmineCell = @"scmineCell";
    SCMineCell *cell = [tableView dequeueReusableCellWithIdentifier:scmineCell];
    if (cell == nil) {
        cell = [[SCMineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scmineCell];
    }
    NSString *imageStr = [NSString stringWithFormat:@"%@", mineModel.imageName];
    cell.imageView.image = [UIImage imageNamed:imageStr];
    cell.textLabel.text = mineModel.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}
@end
