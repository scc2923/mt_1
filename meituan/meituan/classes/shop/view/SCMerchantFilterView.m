//
//  SCMerchantFilterView.m
//  meituan
//
//  Created by scc on 16/4/13.
//  Copyright © 2016年 scc. All rights reserved.
//
#define TableViewW self.frame.size.width
#define TableViewH self.frame.size.height
#import "SCMerchantFilterView.h"
#import "SCKindFilterCell.h"
#import "SCMerchantCataGroupModel.h"
#import "SCKindSubclassFilterCell.h"

@interface SCMerchantFilterView ()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_bigGroupArray;//左边分组tableview的数据源
    NSMutableArray *_smallGroupArray;//右边分组tableview的数据源
    
    NSInteger _bigSelectedIndex;
    NSInteger _smallSelectedIndex;
}

@end
@implementation SCMerchantFilterView
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        _bigGroupArray = [[NSMutableArray alloc] init];
        _smallGroupArray = [[NSMutableArray alloc] init];
        
        [self initViews];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self getCateListData];
        });
    }
    return self;
}

-(void)initViews{
    for (int i = 0 ; i < 2; i ++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(i *TableViewW/2,  0, TableViewW/2, TableViewH) style:UITableViewStylePlain];
        tableView.tag = 10 + i ;
        tableView.delegate = self;
        tableView.dataSource = self;
        if (i == 0 ) {
            self.tableViewOfGroup =tableView;
            self.tableViewOfGroup.backgroundColor = [UIColor whiteColor];
            
        }else{
            self.tableViewOfDetail =tableView;
            self.tableViewOfDetail.backgroundColor = RGB(242, 242, 242);
            
        }
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];
        
    }
    
}

-(void)getCateListData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithCateListStr];
    NSURL *URL = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *dataArray = [responseObject objectForKey:@"data"];
        for (int i = 0; i < dataArray.count; i++) {
            SCMerchantCataGroupModel *cateModel = [SCMerchantCataGroupModel mj_objectWithKeyValues:dataArray[i]];
            [_bigGroupArray addObject:cateModel];
        }
        [self.tableViewOfGroup reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 10) {
        return _bigGroupArray.count;
    }else{
        if (_bigGroupArray.count == 0) {
            return 0;
        }
        SCMerchantCataGroupModel *subclassCateM = (SCMerchantCataGroupModel *)_bigGroupArray[_bigSelectedIndex];
        if (subclassCateM.list == nil) {
            return 0;
        }else{
            return subclassCateM.list.count;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 42;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        SCKindFilterCell *cell = [SCKindFilterCell cellWithTableView:tableView];
        cell.merchantCataGroupModel = _bigGroupArray[indexPath.row];
        return cell;
    }else{
        SCMerchantCataGroupModel *cateModel = (SCMerchantCataGroupModel *)_bigGroupArray[_bigSelectedIndex];
        SCKindSubclassFilterCell *cell = [SCKindSubclassFilterCell cellWithTableView:tableView indexPath:indexPath model:cateModel];
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        _bigSelectedIndex = indexPath.row;
        SCMerchantCataGroupModel *cataModel =  _bigGroupArray[_bigSelectedIndex];
        [self.tableViewOfDetail reloadData];
        if (cataModel.list == nil) {
            [self.tableViewOfDetail reloadData];
            [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath withId:cataModel.id];
        }else{
            [self.tableViewOfDetail reloadData];
        }
    }else{
        _smallSelectedIndex = indexPath.row;
        SCMerchantCataGroupModel *cataModel =  _bigGroupArray[_bigSelectedIndex];
        NSDictionary *dict =  cataModel.list[_smallSelectedIndex];
        NSNumber *ID = [dict objectForKey:@"id"];
        //        NSString *name = [dic objectForKey:@"name"];
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath withId:ID ];
        
    }
    
}



@end
