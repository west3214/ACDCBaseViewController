//
//  BaseTableViewController.h
//  JTProject
//
//  Created by 张西方 on 2018/11/17.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseViewController.h"




NS_ASSUME_NONNULL_BEGIN

@interface ACBaseTableViewController : ACBaseViewController<UITableViewDelegate, UITableViewDataSource>

/**<#Description#>*/
@property (nonatomic, strong) UITableView *tableView;
/**<#Description#>*/
@property (nonatomic, strong) NSMutableArray *dataList;
#pragma mark ----- <#markMessage#>
-(void)loadDataRefresh;
-(void)loadDataMore;

@end

NS_ASSUME_NONNULL_END
