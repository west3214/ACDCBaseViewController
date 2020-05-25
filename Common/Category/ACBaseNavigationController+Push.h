//
//  ACBaseNavigationController+Push.h
//  JTProject
//
//  Created by 张西方 on 2018/11/17.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseNavigationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Push)
-(void)pushLikePresentToViewController:(UIViewController *)viewController;
-(void)popLikePresentViewControllerAnimated;
@end

NS_ASSUME_NONNULL_END
