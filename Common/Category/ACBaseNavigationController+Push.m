//
//  ACBaseNavigationController+Push.m
//  JTProject
//
//  Created by 张西方 on 2018/11/17.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseNavigationController+Push.h"

@implementation ACBaseNavigationController (Push)
-(void)pushLikePresentToViewController:(UIViewController *)viewController{
    CATransition* transition = [CATransition animation];
    transition.duration =0.2f;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    [self.view.layer addAnimation:transition forKey:kCATransition];
    [self pushViewController:viewController animated:NO];
 
}

-(void)popLikePresentViewControllerAnimated{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.2f;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    [self.view.layer addAnimation:transition forKey:kCATransition];
    [self popViewControllerAnimated:NO];
  
}
@end
