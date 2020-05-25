//
//  BaseScrollViewController.h
//  JTProject
//
//  Created by 张西方 on 2018/11/22.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseScrollViewController : ACBaseViewController
/**<#Description#>*/
@property (nonatomic, strong) UIScrollView *scrollView;
/**<#Description#>*/
@property (nonatomic, strong) UIView *contentView;


#pragma mark ----- <#markMessage#>
-(void)loadDataRefresh;
-(void)loadDataMore;
@end

NS_ASSUME_NONNULL_END
