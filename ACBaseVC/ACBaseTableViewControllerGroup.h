//
//  BaseTableViewControllerGroup.h
//  JTProject
//
//  Created by 张西方 on 2018/12/7.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseTableViewControllerGroup : ACBaseViewController<UITableViewDelegate, UITableViewDataSource>

/**<#Description#>*/
@property (nonatomic, strong) UITableView *tableView;
/**<#Description#>*/
@property (nonatomic, strong) NSMutableArray *dataList;
#pragma mark ----- <#markMessage#>
-(void)loadDataRefresh;
-(void)loadDataMore;
@end

NS_ASSUME_NONNULL_END
