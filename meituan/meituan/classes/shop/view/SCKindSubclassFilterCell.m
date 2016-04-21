//
//  SCKindSubclassFilterCell.m
//  meituan
//
//  Created by scc on 16/4/16.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCKindSubclassFilterCell.h"

@implementation SCKindSubclassFilterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath model:(SCMerchantCataGroupModel *)model{
    static NSString *kindSubclassFilter = @"SCKindSubclassFilterCell";
    SCKindSubclassFilterCell *cell = [tableView dequeueReusableCellWithIdentifier:kindSubclassFilter];
    if (cell == nil) {
        cell = [[SCKindSubclassFilterCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kindSubclassFilter];
    }
    
    
    //用这个方法给子分类 赋值的话 不能识别是哪一行的 所以用传NSIndexPath
     for (NSDictionary  *dict  in  model.list) {
     cell.textLabel.text = dict [@"name"];
     cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", dict [@"count"]];
     }
    
    
    cell.textLabel.text = [model.list [indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [model.list [indexPath.row] objectForKey:@"count"]];
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    cell.backgroundColor = RGB(242, 242, 242);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

@end
