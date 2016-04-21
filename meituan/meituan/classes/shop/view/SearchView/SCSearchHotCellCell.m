//
//  SCSearchHotCellCell.m
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCSearchHotCellCell.h"

@interface SCSearchHotCellCell()
@property(nonatomic, strong)UIButton *button;
@property (nonatomic , strong)NSArray *hotDatas;
@property(nonatomic, strong) NSIndexPath *indexPath;
@end
@implementation SCSearchHotCellCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SCSearchHotCellCell";
    SCSearchHotCellCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SCSearchHotCellCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.hotDatas =hotDatas;
    //    cell.indexPath = indexPath;
    //    [cell.button setTitle:buttontitle forState:UIControlStateNormal] ;
    return cell;
}
-(void)setArray:(NSArray *)array{
    _array = array;
    NSInteger buttons = array.count;
    CGFloat margin = 10;
    CGFloat buttonW = (SCREENWIDTH - (buttons +1 ) * margin)/buttons;
    for (int i = 0 ; i < array.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button = button;
        button.frame = CGRectMake( margin + i * (buttonW +margin) , 5, buttonW   , 40);
        NSString *buttontitle = array[i];
        
        [button setTitle:buttontitle forState:UIControlStateNormal];
        button.backgroundColor = navigationBarColor;
        [self addSubview:button];
    }
    
}

@end
