
//
//  SCHotCityNameCell.m
//  meituan
//
//  Created by scc on 16/4/9.
//  Copyright © 2016年 scc. All rights reserved.
//

#import "SCHotCityNameCell.h"

@implementation SCHotCityNameCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView hotCityArray:(NSArray *)hotCityArray{
    static NSString *cellIndentifier = @"SCHotCityNameCell";
    SCHotCityNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[SCHotCityNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier hotCityArray:hotCityArray];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hotCityArray:(NSArray *)hotCityArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int totalloc = 3;
        
        CGFloat buttonw = 70;
        CGFloat buttonh = 30;
        
        //算出间距 self.frame.size.width
        CGFloat margin=(self.frame.size.width - totalloc * buttonw) / (totalloc + 1);
        //int count=11;
        for (int i = 0; i < hotCityArray.count; i++) {
            
            int row = i / totalloc;//行号
            //0/3=0,1/3=0,2/3=1; (i 从0到2都是第一行) i＝ 3的时候第二行
            
            int loc = i % totalloc;//列号
            
            //横坐标
            CGFloat buttonx = margin + (margin + buttonw) * loc;
            
            //纵坐标
            CGFloat buttony = margin + (margin + buttonh) * row;
            
            //创建uiview控件
            UIButton *areaButton=[[UIButton alloc]initWithFrame:CGRectMake(buttonx, buttony, buttonw, buttonh)];
            [areaButton setTitle:hotCityArray[i] forState:UIControlStateNormal];
            [areaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [areaButton setBackgroundColor: separaterColor];
            [areaButton addTarget:self action:@selector(hotCityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:areaButton];
        }
    }
    
    return self;
    
}
-(void)hotCityButtonClick:(UIButton *)button {
    
}

@end
