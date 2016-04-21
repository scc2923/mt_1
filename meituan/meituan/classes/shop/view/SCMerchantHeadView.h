//
//  SCMerchantHeadView.h
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCmerchanHeaderModel.h"
@protocol SCMerchantHeadViewRefreshDelegate<NSObject>
-(void)merchantHeadViewRefreshButtonClick;
@end


@interface SCMerchantHeadView : UIView
- (IBAction)refreshAddressBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentAddressLabel;
/**
 *  快速创建henderView
 *
 */
+ (instancetype)headViewWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)SCmerchanHeaderModel *headModel;
@property(nonatomic, weak) id<SCMerchantHeadViewRefreshDelegate>delegate;

@end
