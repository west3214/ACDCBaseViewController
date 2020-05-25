//
//  BaseWebViewController.h
//  JTProject
//
//  Created by 张西方 on 2018/11/19.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseWebViewController : ACBaseViewController
-(instancetype)initWithUrl:(NSString *)url WithTitle:(NSString *)title;


/**<# #>*/
@property (nonatomic, strong) UIButton *rightNaVBtnnn;
/**<# #>*/
@property (nonatomic, assign) BOOL isFromBorrowVC;

/**<# #>*/
@property (nonatomic, copy) void (^rightNaVBtnnnBlock)(void);
@end

NS_ASSUME_NONNULL_END
