//
//  BaseNavigationController.m
//  JTProject
//
//  Created by iMac on 2018/11/13.
//  Copyright © 2018 iMac. All rights reserved.
//

#import "ACBaseNavigationController.h"
#import "ACLoginViewController.h"
@interface ACBaseNavigationController ()

@end

@implementation ACBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //隐藏导航条下的线
    /*单页面设置**/
    /*
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    //如果不想影响其他页面的导航透明度，viewWillDisappear将其设置为nil即可:
    
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:nil];
    */
    
    //全局设置
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [self setStatusBarBackgroundColor:LL_ThemeColor];
    
    self.navigationBarHidden = YES;


}




- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark ----- 跳转检查登录
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated IfCheckLoging:(BOOL)ifCheck{
    if (ifCheck) {
        ACUserModel *model = [ACSystemPreferrence objectForKey:ACUserLoginData];
        if (!model) {
            ACLoginViewController *loginVC = [[ACLoginViewController alloc] init];
            loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:loginVC animated:YES completion:nil];
        }else{
            [self pushViewController:viewController animated:animated];
        }
    }else{
        [self.navigationController pushViewController:viewController animated:animated];
    }
}
@end
