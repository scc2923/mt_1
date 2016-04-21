//
//  SCHotQueueCell.m
//  JFMeiTuan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "SCHotQueueCell.h"
#import "SCHotQueueModel.h"
@implementation SCHotQueueCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"hotqueue";
    SCHotQueueCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCHotQueueCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)setHotQueueModel:(SCHotQueueModel *)hotQueueModel{
    _hotQueueModel = hotQueueModel;
    
    NSURL *urlStr = [NSURL URLWithString:hotQueueModel.imageUrl];
    [self.hotQueueImageView sd_setImageWithURL:urlStr  placeholderImage:nil];
    self.mainLabel.text = hotQueueModel.title;
    self.subtitleLabel.text = hotQueueModel.comment;
}

@end
