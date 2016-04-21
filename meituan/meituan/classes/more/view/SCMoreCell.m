//
//  SCMoreCell.m
//  meituan
//
//  Created by scc on 16/4/19.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCMoreCell.h"

@implementation SCMoreCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath moreArray:(NSArray *)moreArray{
    static NSString *scMoreCell = @"scMoreCell";
    SCMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:scMoreCell];
    if (cell == nil) {
        cell = [[SCMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scMoreCell];
    }
    
    cell.textLabel.text = [moreArray[indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

@end
