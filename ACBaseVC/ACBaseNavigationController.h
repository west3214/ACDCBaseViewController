//
//  BaseNavigationController.h
//  JTProject
//
//  Created by iMac on 2018/11/13.
//  Copyright © 2018 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ACBaseNavigationController+Push.h"
NS_ASSUME_NONNULL_BEGIN

@interface ACBaseNavigationController : UINavigationController
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated IfCheckLoging:(BOOL)ifCheck;
@end

NS_ASSUME_NONNULL_END
